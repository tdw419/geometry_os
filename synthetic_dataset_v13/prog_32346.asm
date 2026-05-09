; DESCRIPTION: Composite: Renders a black box of size 20x43 starting at (317, 127) then Draws a green line from (258, 149) to (14, 179) then Draws a black circle centered at (365, 27) with radius 11.
; PLAN: r0=317(x), r1=127(y), r2=20(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x1), r6=149(y1), r7=14(x2), r8=179(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=27(y), r12=11(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 127
LDI r2, 20
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 149
LDI r7, 14
LDI r8, 179
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 27
LDI r12, 11
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
