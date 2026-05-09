; DESCRIPTION: Composite: Draws a yellow line from (195, 89) to (27, 55) then Draws a white circle centered at (59, 103) with radius 56 then Sets a single green pixel at (171, 180).
; PLAN: r0=195(x1), r1=89(y1), r2=27(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=103(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=180(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 89
LDI r2, 27
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 103
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 180
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
