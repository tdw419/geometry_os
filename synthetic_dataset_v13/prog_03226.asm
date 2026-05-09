; DESCRIPTION: Composite: Renders a blue line between points (163, 222) and (194, 183) then Renders a red box of size 120x62 starting at (43, 175).
; PLAN: r0=163(x1), r1=222(y1), r2=194(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=175(y), r7=120(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 222
LDI r2, 194
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 175
LDI r7, 120
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
