; DESCRIPTION: Composite: Draws a orange line from (148, 43) to (456, 39) then Renders a red disk with center (374, 124) and radius 31 then Places a black dot at position (45, 234).
; PLAN: r0=148(x1), r1=43(y1), r2=456(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=124(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x), r11=234(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 43
LDI r2, 456
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 124
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 234
LDI r12, 0x000000
PSET r10, r11, r12
HALT
