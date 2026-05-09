; DESCRIPTION: Composite: Renders a cyan disk with center (483, 22) and radius 20 then Renders a black line between points (300, 233) and (444, 236) then Places a black dot at position (35, 214).
; PLAN: r0=483(x), r1=22(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=233(y1), r7=444(x2), r8=236(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=214(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 483
LDI r1, 22
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 233
LDI r7, 444
LDI r8, 236
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 214
LDI r12, 0x000000
PSET r10, r11, r12
HALT
