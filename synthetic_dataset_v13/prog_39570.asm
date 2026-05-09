; DESCRIPTION: Composite: Renders a orange box of size 85x87 starting at (192, 15) then Renders a white line between points (462, 188) and (205, 93).
; PLAN: r0=192(x), r1=15(y), r2=85(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x1), r6=188(y1), r7=205(x2), r8=93(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 15
LDI r2, 85
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 188
LDI r7, 205
LDI r8, 93
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
