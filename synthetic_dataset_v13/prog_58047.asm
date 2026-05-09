; DESCRIPTION: Composite: Renders a orange box of size 85x115 starting at (275, 27) then Places a purple line segment connecting (54, 49) to (110, 170).
; PLAN: r0=275(x), r1=27(y), r2=85(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x1), r6=49(y1), r7=110(x2), r8=170(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 27
LDI r2, 85
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 49
LDI r7, 110
LDI r8, 170
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
