; DESCRIPTION: Composite: Draws a magenta line from (199, 136) to (83, 33) then Draws a red rectangle at (61, 7) with width 43 and height 107 then Sets a single magenta pixel at (157, 84).
; PLAN: r0=199(x1), r1=136(y1), r2=83(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=7(y), r7=43(width), r8=107(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=157(x), r11=84(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 136
LDI r2, 83
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 7
LDI r7, 43
LDI r8, 107
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 84
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
