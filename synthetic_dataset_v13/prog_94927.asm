; DESCRIPTION: Composite: Renders a yellow line between points (206, 228) and (440, 35) then Renders a orange disk with center (120, 108) and radius 11 then Sets a single black pixel at (492, 205).
; PLAN: r0=206(x1), r1=228(y1), r2=440(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=108(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=492(x), r11=205(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 206
LDI r1, 228
LDI r2, 440
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 108
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 492
LDI r11, 205
LDI r12, 0x000000
PSET r10, r11, r12
HALT
