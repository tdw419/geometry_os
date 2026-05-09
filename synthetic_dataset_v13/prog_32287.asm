; DESCRIPTION: Composite: Renders a purple disk with center (397, 181) and radius 38 then Places a blue dot at position (219, 111) then Renders a green line between points (68, 145) and (353, 108).
; PLAN: r0=397(x), r1=181(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=111(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=68(x1), r11=145(y1), r12=353(x2), r13=108(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 181
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 111
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 68
LDI r11, 145
LDI r12, 353
LDI r13, 108
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
