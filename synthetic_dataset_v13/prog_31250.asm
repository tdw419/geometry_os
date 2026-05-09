; DESCRIPTION: Composite: Renders a blue disk with center (232, 149) and radius 74 then Places a black dot at position (501, 200) then Renders a red line between points (467, 39) and (275, 214).
; PLAN: r0=232(x), r1=149(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=501(x), r6=200(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=467(x1), r11=39(y1), r12=275(x2), r13=214(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 149
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 501
LDI r6, 200
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 467
LDI r11, 39
LDI r12, 275
LDI r13, 214
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
