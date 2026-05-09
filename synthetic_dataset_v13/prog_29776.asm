; DESCRIPTION: Composite: Draws a orange line from (434, 114) to (479, 104) then Renders a green disk with center (81, 80) and radius 75 then Sets a single green pixel at (27, 135).
; PLAN: r0=434(x1), r1=114(y1), r2=479(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=80(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=135(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 114
LDI r2, 479
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 80
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 135
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
