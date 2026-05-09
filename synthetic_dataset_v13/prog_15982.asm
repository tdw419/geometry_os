; DESCRIPTION: Composite: Places a purple 94x21 rectangle at position (235, 47) then Draws a orange line from (407, 47) to (379, 233) then Sets a single cyan pixel at (338, 148).
; PLAN: r0=235(x), r1=47(y), r2=94(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x1), r6=47(y1), r7=379(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=148(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 235
LDI r1, 47
LDI r2, 94
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 47
LDI r7, 379
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 148
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
