; DESCRIPTION: Composite: Draws a white line from (99, 215) to (217, 7) then Places a green dot at position (289, 79) then Draws a green circle centered at (340, 108) with radius 78.
; PLAN: r0=99(x1), r1=215(y1), r2=217(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=79(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=340(x), r11=108(y), r12=78(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 99
LDI r1, 215
LDI r2, 217
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 79
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 340
LDI r11, 108
LDI r12, 78
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
