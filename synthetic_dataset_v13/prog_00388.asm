; DESCRIPTION: Composite: Draws a black line from (432, 45) to (60, 243) then Places a purple 111x37 rectangle at position (340, 144) then Sets a single green pixel at (10, 176).
; PLAN: r0=432(x1), r1=45(y1), r2=60(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=144(y), r7=111(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=10(x), r11=176(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 432
LDI r1, 45
LDI r2, 60
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 144
LDI r7, 111
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 176
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
