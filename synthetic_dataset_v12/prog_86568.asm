; DESCRIPTION: Composite: Renders a blue line between points (232, 149) and (39, 98) then Places a cyan circle of radius 55 at center (324, 129) then Sets a single white pixel at (463, 240).
; PLAN: r0=232(x1), r1=149(y1), r2=39(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=129(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=463(x), r11=240(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 149
LDI r2, 39
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 129
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 463
LDI r11, 240
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
