; DESCRIPTION: Composite: Draws a red rectangle at (358, 94) with width 65 and height 49 then Sets a single blue pixel at (365, 161) then Places a white line segment connecting (124, 61) to (83, 125).
; PLAN: r0=358(x), r1=94(y), r2=65(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=161(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=124(x1), r11=61(y1), r12=83(x2), r13=125(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 94
LDI r2, 65
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 161
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 124
LDI r11, 61
LDI r12, 83
LDI r13, 125
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
