; DESCRIPTION: Composite: Renders a black line between points (301, 115) and (291, 16) then Places a cyan circle of radius 62 at center (188, 176) then Places a black dot at position (153, 253).
; PLAN: r0=301(x1), r1=115(y1), r2=291(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=176(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=253(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 115
LDI r2, 291
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 176
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 253
LDI r12, 0x000000
PSET r10, r11, r12
HALT
