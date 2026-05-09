; DESCRIPTION: Composite: Draws a purple rectangle at (226, 182) with width 77 and height 17 then Places a black line segment connecting (433, 51) to (160, 120) then Places a cyan dot at position (380, 211).
; PLAN: r0=226(x), r1=182(y), r2=77(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x1), r6=51(y1), r7=160(x2), r8=120(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=211(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 182
LDI r2, 77
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 51
LDI r7, 160
LDI r8, 120
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 211
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
