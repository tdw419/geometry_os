; DESCRIPTION: Composite: Renders a black line between points (81, 177) and (86, 149) then Places a cyan circle of radius 12 at center (391, 31) then Places a yellow dot at position (173, 167).
; PLAN: r0=81(x1), r1=177(y1), r2=86(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=31(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x), r11=167(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 177
LDI r2, 86
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 31
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 167
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
