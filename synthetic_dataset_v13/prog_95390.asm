; DESCRIPTION: Composite: Renders a orange box of size 47x97 starting at (136, 22) then Renders a white disk with center (83, 161) and radius 68.
; PLAN: r0=136(x), r1=22(y), r2=47(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=161(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 22
LDI r2, 47
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 161
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
