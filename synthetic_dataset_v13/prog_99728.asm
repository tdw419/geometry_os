; DESCRIPTION: Composite: Places a cyan dot at position (163, 39) then Places a white circle of radius 51 at center (223, 127) then Places a white line segment connecting (336, 211) to (133, 45).
; PLAN: r0=163(x), r1=39(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=127(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=336(x1), r11=211(y1), r12=133(x2), r13=45(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 39
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 127
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 336
LDI r11, 211
LDI r12, 133
LDI r13, 45
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
