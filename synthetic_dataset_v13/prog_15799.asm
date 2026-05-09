; DESCRIPTION: Composite: Renders a purple box of size 27x93 starting at (259, 155) then Places a blue line segment connecting (317, 102) to (502, 42) then Places a yellow circle of radius 76 at center (145, 155).
; PLAN: r0=259(x), r1=155(y), r2=27(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x1), r6=102(y1), r7=502(x2), r8=42(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=155(y), r12=76(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 155
LDI r2, 27
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 102
LDI r7, 502
LDI r8, 42
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 155
LDI r12, 76
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
