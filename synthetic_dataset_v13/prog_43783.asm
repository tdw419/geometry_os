; DESCRIPTION: Composite: Places a purple circle of radius 41 at center (390, 206) then Renders a orange box of size 33x36 starting at (50, 112).
; PLAN: r0=390(x), r1=206(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x), r6=112(y), r7=33(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 206
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 112
LDI r7, 33
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
