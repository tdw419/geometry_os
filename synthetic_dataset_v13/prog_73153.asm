; DESCRIPTION: Composite: Places a yellow line segment connecting (34, 67) to (83, 253) then Places a orange 12x119 rectangle at position (395, 119).
; PLAN: r0=34(x1), r1=67(y1), r2=83(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=119(y), r7=12(width), r8=119(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 67
LDI r2, 83
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 119
LDI r7, 12
LDI r8, 119
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
