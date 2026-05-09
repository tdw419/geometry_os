; DESCRIPTION: Composite: Creates a red rectangular region at (399, 41) spanning 108 by 107 pixels then Renders a blue disk with center (149, 112) and radius 36.
; PLAN: r0=399(x), r1=41(y), r2=108(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=112(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 41
LDI r2, 108
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 112
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
