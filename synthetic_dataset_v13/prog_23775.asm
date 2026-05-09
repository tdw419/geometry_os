; DESCRIPTION: Composite: Draws a orange line from (24, 143) to (250, 172) then Creates a cyan circular shape at (333, 154) with radius 77.
; PLAN: r0=24(x1), r1=143(y1), r2=250(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=154(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 24
LDI r1, 143
LDI r2, 250
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 154
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
