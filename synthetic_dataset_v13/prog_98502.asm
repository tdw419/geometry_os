; DESCRIPTION: Composite: Draws a cyan rectangle at (372, 22) with width 110 and height 83 then Places a purple line segment connecting (454, 128) to (146, 77).
; PLAN: r0=372(x), r1=22(y), r2=110(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=128(y1), r7=146(x2), r8=77(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 22
LDI r2, 110
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 128
LDI r7, 146
LDI r8, 77
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
