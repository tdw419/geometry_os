; DESCRIPTION: Composite: Places a purple line segment connecting (285, 19) to (382, 234) then Places a purple dot at position (363, 209) then Draws a purple circle centered at (403, 121) with radius 55.
; PLAN: r0=285(x1), r1=19(y1), r2=382(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=209(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=403(x), r11=121(y), r12=55(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 19
LDI r2, 382
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 209
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 403
LDI r11, 121
LDI r12, 55
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
