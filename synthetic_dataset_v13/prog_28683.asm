; DESCRIPTION: Composite: Draws a purple circle centered at (400, 152) with radius 47 then Places a blue dot at position (262, 185) then Places a cyan line segment connecting (145, 111) to (313, 232).
; PLAN: r0=400(x), r1=152(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x), r6=185(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=145(x1), r11=111(y1), r12=313(x2), r13=232(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 152
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 185
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 145
LDI r11, 111
LDI r12, 313
LDI r13, 232
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
