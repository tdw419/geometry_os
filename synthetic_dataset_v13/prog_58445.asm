; DESCRIPTION: Composite: Renders a orange line between points (124, 193) and (111, 73) then Creates a cyan circular shape at (180, 195) with radius 26 then Places a red dot at position (139, 10).
; PLAN: r0=124(x1), r1=193(y1), r2=111(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=195(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x), r11=10(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 193
LDI r2, 111
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 195
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 10
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
