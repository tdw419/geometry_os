; DESCRIPTION: Composite: Draws a cyan line from (459, 237) to (2, 146) then Draws a orange rectangle at (3, 34) with width 83 and height 51 then Sets a single purple pixel at (338, 51).
; PLAN: r0=459(x1), r1=237(y1), r2=2(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=34(y), r7=83(width), r8=51(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=338(x), r11=51(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 459
LDI r1, 237
LDI r2, 2
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 34
LDI r7, 83
LDI r8, 51
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 51
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
