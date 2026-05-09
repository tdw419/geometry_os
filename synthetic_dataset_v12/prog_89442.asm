; DESCRIPTION: Composite: Draws a blue rectangle at (209, 70) with width 18 and height 106 then Places a cyan line segment connecting (461, 3) to (328, 190) then Sets a single blue pixel at (433, 207).
; PLAN: r0=209(x), r1=70(y), r2=18(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x1), r6=3(y1), r7=328(x2), r8=190(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=433(x), r11=207(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 209
LDI r1, 70
LDI r2, 18
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 3
LDI r7, 328
LDI r8, 190
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 207
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
