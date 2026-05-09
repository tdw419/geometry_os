; DESCRIPTION: Composite: Renders a orange line between points (1, 209) and (434, 143) then Draws a cyan circle centered at (248, 149) with radius 70 then Sets a single black pixel at (38, 48).
; PLAN: r0=1(x1), r1=209(y1), r2=434(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=149(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x), r11=48(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 209
LDI r2, 434
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 149
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 48
LDI r12, 0x000000
PSET r10, r11, r12
HALT
