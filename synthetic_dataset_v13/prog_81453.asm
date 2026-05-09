; DESCRIPTION: Composite: Sets a single blue pixel at (125, 70) then Draws a blue rectangle at (203, 121) with width 110 and height 51 then Places a white line segment connecting (417, 228) to (77, 125).
; PLAN: r0=125(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=121(y), r7=110(width), r8=51(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x1), r11=228(y1), r12=77(x2), r13=125(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 70
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 121
LDI r7, 110
LDI r8, 51
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 228
LDI r12, 77
LDI r13, 125
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
