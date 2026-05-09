; DESCRIPTION: Composite: Renders a orange box of size 16x80 starting at (285, 99) then Renders a white line between points (387, 157) and (172, 89) then Sets a single yellow pixel at (333, 119).
; PLAN: r0=285(x), r1=99(y), r2=16(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x1), r6=157(y1), r7=172(x2), r8=89(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=119(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 99
LDI r2, 16
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 157
LDI r7, 172
LDI r8, 89
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 119
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
