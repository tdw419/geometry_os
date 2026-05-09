; DESCRIPTION: Composite: Renders a blue box of size 86x53 starting at (371, 55) then Renders a white line between points (502, 99) and (61, 235) then Sets a single orange pixel at (106, 180).
; PLAN: r0=371(x), r1=55(y), r2=86(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x1), r6=99(y1), r7=61(x2), r8=235(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=106(x), r11=180(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 55
LDI r2, 86
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 99
LDI r7, 61
LDI r8, 235
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 180
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
