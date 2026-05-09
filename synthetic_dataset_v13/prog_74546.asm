; DESCRIPTION: Composite: Draws a white circle centered at (349, 108) with radius 71 then Places a purple dot at position (473, 112) then Places a black line segment connecting (54, 205) to (152, 45).
; PLAN: r0=349(x), r1=108(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x), r6=112(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=54(x1), r11=205(y1), r12=152(x2), r13=45(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 108
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 112
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 54
LDI r11, 205
LDI r12, 152
LDI r13, 45
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
