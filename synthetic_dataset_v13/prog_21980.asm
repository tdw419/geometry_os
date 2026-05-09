; DESCRIPTION: Composite: Draws a cyan rectangle at (32, 120) with width 38 and height 75 then Draws a purple line from (76, 251) to (480, 145).
; PLAN: r0=32(x), r1=120(y), r2=38(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=251(y1), r7=480(x2), r8=145(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 120
LDI r2, 38
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 251
LDI r7, 480
LDI r8, 145
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
