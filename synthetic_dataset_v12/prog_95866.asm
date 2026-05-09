; DESCRIPTION: Composite: Renders a black line between points (172, 188) and (434, 61) then Places a magenta dot at position (223, 167) then Renders a red disk with center (295, 98) and radius 76.
; PLAN: r0=172(x1), r1=188(y1), r2=434(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=167(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=98(y), r12=76(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 188
LDI r2, 434
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 167
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 295
LDI r11, 98
LDI r12, 76
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
