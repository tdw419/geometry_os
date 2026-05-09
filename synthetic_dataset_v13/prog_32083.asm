; DESCRIPTION: Composite: Creates a blue circular shape at (352, 117) with radius 29 then Renders a orange box of size 25x98 starting at (409, 145).
; PLAN: r0=352(x), r1=117(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=145(y), r7=25(width), r8=98(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 117
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 145
LDI r7, 25
LDI r8, 98
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
