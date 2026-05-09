; DESCRIPTION: Composite: Draws a white line from (345, 84) to (104, 229) then Creates a cyan circular shape at (331, 122) with radius 44.
; PLAN: r0=345(x1), r1=84(y1), r2=104(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=122(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 84
LDI r2, 104
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 122
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
