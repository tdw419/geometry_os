; DESCRIPTION: Composite: Renders a magenta box of size 15x101 starting at (202, 20) then Draws a green line from (440, 160) to (130, 161).
; PLAN: r0=202(x), r1=20(y), r2=15(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x1), r6=160(y1), r7=130(x2), r8=161(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 20
LDI r2, 15
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 160
LDI r7, 130
LDI r8, 161
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
