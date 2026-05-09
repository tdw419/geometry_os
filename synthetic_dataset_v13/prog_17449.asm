; DESCRIPTION: Composite: Renders a black line between points (119, 100) and (198, 9) then Places a magenta dot at position (266, 171) then Places a cyan circle of radius 24 at center (132, 64).
; PLAN: r0=119(x1), r1=100(y1), r2=198(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=171(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=64(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 100
LDI r2, 198
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 171
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 132
LDI r11, 64
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
