; DESCRIPTION: Composite: Renders a black line between points (278, 178) and (454, 102) then Places a blue dot at position (215, 120) then Places a cyan circle of radius 76 at center (343, 178).
; PLAN: r0=278(x1), r1=178(y1), r2=454(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=120(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=343(x), r11=178(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 178
LDI r2, 454
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 120
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 343
LDI r11, 178
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
