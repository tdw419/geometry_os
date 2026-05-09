; DESCRIPTION: Composite: Places a cyan line segment connecting (110, 186) to (210, 160) then Draws a white rectangle at (3, 61) with width 30 and height 18.
; PLAN: r0=110(x1), r1=186(y1), r2=210(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=61(y), r7=30(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 186
LDI r2, 210
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 61
LDI r7, 30
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
