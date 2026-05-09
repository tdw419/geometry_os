; DESCRIPTION: Composite: Places a blue 34x20 rectangle at position (110, 53) then Places a red line segment connecting (16, 227) to (488, 105).
; PLAN: r0=110(x), r1=53(y), r2=34(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=227(y1), r7=488(x2), r8=105(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 53
LDI r2, 34
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 227
LDI r7, 488
LDI r8, 105
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
