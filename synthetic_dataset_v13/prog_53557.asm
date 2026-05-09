; DESCRIPTION: Composite: Renders a purple disk with center (78, 47) and radius 43 then Sets a single black pixel at (494, 180) then Places a cyan line segment connecting (278, 129) to (354, 131).
; PLAN: r0=78(x), r1=47(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x), r6=180(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=278(x1), r11=129(y1), r12=354(x2), r13=131(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 47
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 180
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 278
LDI r11, 129
LDI r12, 354
LDI r13, 131
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
