; DESCRIPTION: Composite: Places a white circle of radius 34 at center (471, 67) then Renders a orange box of size 30x62 starting at (436, 99).
; PLAN: r0=471(x), r1=67(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=99(y), r7=30(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 67
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 99
LDI r7, 30
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
