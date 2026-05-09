; DESCRIPTION: Composite: Renders a green disk with center (47, 89) and radius 46 then Places a white dot at position (302, 227) then Renders a white line between points (494, 182) and (480, 138).
; PLAN: r0=47(x), r1=89(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=227(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=494(x1), r11=182(y1), r12=480(x2), r13=138(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 89
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 227
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 494
LDI r11, 182
LDI r12, 480
LDI r13, 138
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
