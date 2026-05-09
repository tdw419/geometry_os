; DESCRIPTION: Composite: Renders a blue box of size 77x82 starting at (187, 82) then Draws a black line from (444, 5) to (154, 115) then Renders a red disk with center (327, 42) and radius 42.
; PLAN: r0=187(x), r1=82(y), r2=77(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x1), r6=5(y1), r7=154(x2), r8=115(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=42(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 82
LDI r2, 77
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 5
LDI r7, 154
LDI r8, 115
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 42
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
