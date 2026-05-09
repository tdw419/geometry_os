; DESCRIPTION: Composite: Places a black line segment connecting (429, 62) to (320, 233) then Renders a purple disk with center (423, 135) and radius 72.
; PLAN: r0=429(x1), r1=62(y1), r2=320(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=135(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 62
LDI r2, 320
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 135
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
