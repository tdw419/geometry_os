; DESCRIPTION: Composite: Places a blue circle of radius 69 at center (383, 83) then Renders a white box of size 112x98 starting at (117, 70).
; PLAN: r0=383(x), r1=83(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x), r6=70(y), r7=112(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 83
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 70
LDI r7, 112
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
