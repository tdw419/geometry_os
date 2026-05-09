; DESCRIPTION: Composite: Renders a purple box of size 110x41 starting at (274, 86) then Places a orange line segment connecting (360, 138) to (17, 111).
; PLAN: r0=274(x), r1=86(y), r2=110(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x1), r6=138(y1), r7=17(x2), r8=111(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 86
LDI r2, 110
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 138
LDI r7, 17
LDI r8, 111
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
