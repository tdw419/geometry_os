; DESCRIPTION: Composite: Draws a blue rectangle at (411, 138) with width 99 and height 99 then Places a yellow line segment connecting (336, 61) to (235, 103) then Sets a single purple pixel at (460, 17).
; PLAN: r0=411(x), r1=138(y), r2=99(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=61(y1), r7=235(x2), r8=103(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=460(x), r11=17(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 138
LDI r2, 99
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 61
LDI r7, 235
LDI r8, 103
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 17
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
