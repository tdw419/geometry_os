; DESCRIPTION: Composite: Draws a orange line from (458, 59) to (160, 200) then Renders a purple disk with center (281, 196) and radius 43 then Sets a single green pixel at (236, 166).
; PLAN: r0=458(x1), r1=59(y1), r2=160(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=196(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x), r11=166(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 458
LDI r1, 59
LDI r2, 160
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 196
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 166
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
