; DESCRIPTION: Composite: Places a blue 48x12 rectangle at position (283, 47) then Places a red line segment connecting (258, 9) to (432, 148).
; PLAN: r0=283(x), r1=47(y), r2=48(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x1), r6=9(y1), r7=432(x2), r8=148(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 47
LDI r2, 48
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 9
LDI r7, 432
LDI r8, 148
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
