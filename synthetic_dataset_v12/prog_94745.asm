; DESCRIPTION: Composite: Renders a red line between points (377, 224) and (306, 192) then Places a red circle of radius 15 at center (180, 195) then Places a red dot at position (211, 148).
; PLAN: r0=377(x1), r1=224(y1), r2=306(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=195(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=211(x), r11=148(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 224
LDI r2, 306
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 195
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 211
LDI r11, 148
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
