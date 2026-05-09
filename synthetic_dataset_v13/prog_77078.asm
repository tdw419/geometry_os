; DESCRIPTION: Composite: Draws a magenta line from (61, 153) to (240, 18) then Renders a green box of size 109x85 starting at (42, 16) then Places a green dot at position (223, 1).
; PLAN: r0=61(x1), r1=153(y1), r2=240(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=16(y), r7=109(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=223(x), r11=1(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 153
LDI r2, 240
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 16
LDI r7, 109
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 1
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
