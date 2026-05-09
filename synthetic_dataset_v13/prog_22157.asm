; DESCRIPTION: Composite: Draws a blue circle centered at (435, 123) with radius 19 then Draws a green line from (26, 77) to (433, 103) then Sets a single green pixel at (407, 61).
; PLAN: r0=435(x), r1=123(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=77(y1), r7=433(x2), r8=103(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=61(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 435
LDI r1, 123
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 77
LDI r7, 433
LDI r8, 103
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 61
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
