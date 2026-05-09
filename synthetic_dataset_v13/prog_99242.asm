; DESCRIPTION: Composite: Places a magenta line segment connecting (74, 162) to (263, 15) then Draws a purple rectangle at (36, 176) with width 120 and height 12 then Sets a single blue pixel at (365, 140).
; PLAN: r0=74(x1), r1=162(y1), r2=263(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=176(y), r7=120(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=140(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 74
LDI r1, 162
LDI r2, 263
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 176
LDI r7, 120
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 140
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
