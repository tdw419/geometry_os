; DESCRIPTION: Composite: Renders a orange disk with center (394, 96) and radius 16 then Draws a purple line from (449, 177) to (172, 61) then Places a blue dot at position (362, 75).
; PLAN: r0=394(x), r1=96(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x1), r6=177(y1), r7=172(x2), r8=61(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=75(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 96
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 177
LDI r7, 172
LDI r8, 61
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 75
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
