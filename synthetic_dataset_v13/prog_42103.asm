; DESCRIPTION: Composite: Renders a purple disk with center (71, 133) and radius 71 then Renders a blue box of size 84x78 starting at (360, 146).
; PLAN: r0=71(x), r1=133(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=146(y), r7=84(width), r8=78(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 133
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 146
LDI r7, 84
LDI r8, 78
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
