; DESCRIPTION: Composite: Draws a green line from (199, 132) to (2, 145) then Places a green 80x99 rectangle at position (227, 33) then Places a white dot at position (359, 15).
; PLAN: r0=199(x1), r1=132(y1), r2=2(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=33(y), r7=80(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x), r11=15(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 132
LDI r2, 2
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 33
LDI r7, 80
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 15
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
