; DESCRIPTION: Composite: Creates a white rectangular region at (389, 113) spanning 43 by 69 pixels then Renders a purple line between points (125, 64) and (133, 159) then Renders a white disk with center (382, 63) and radius 45.
; PLAN: r0=389(x), r1=113(y), r2=43(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x1), r6=64(y1), r7=133(x2), r8=159(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=63(y), r12=45(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 389
LDI r1, 113
LDI r2, 43
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 64
LDI r7, 133
LDI r8, 159
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 63
LDI r12, 45
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
