; DESCRIPTION: Composite: Renders a black disk with center (128, 116) and radius 27 then Places a red line segment connecting (127, 230) to (44, 193) then Places a yellow dot at position (225, 81).
; PLAN: r0=128(x), r1=116(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x1), r6=230(y1), r7=44(x2), r8=193(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=81(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 128
LDI r1, 116
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 230
LDI r7, 44
LDI r8, 193
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 81
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
