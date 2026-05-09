; DESCRIPTION: Composite: Sets a single purple pixel at (367, 91) then Draws a white line from (17, 45) to (104, 145) then Draws a blue rectangle at (384, 4) with width 42 and height 89.
; PLAN: r0=367(x), r1=91(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=17(x1), r6=45(y1), r7=104(x2), r8=145(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=384(x), r11=4(y), r12=42(width), r13=89(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 91
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 45
LDI r7, 104
LDI r8, 145
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 4
LDI r12, 42
LDI r13, 89
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
