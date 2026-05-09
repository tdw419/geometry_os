; DESCRIPTION: Composite: Places a green 75x20 rectangle at position (14, 15) then Places a blue line segment connecting (405, 175) to (389, 97).
; PLAN: r0=14(x), r1=15(y), r2=75(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x1), r6=175(y1), r7=389(x2), r8=97(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 14
LDI r1, 15
LDI r2, 75
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 175
LDI r7, 389
LDI r8, 97
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
