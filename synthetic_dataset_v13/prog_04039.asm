; DESCRIPTION: Composite: Renders a white box of size 87x70 starting at (232, 69) then Renders a yellow disk with center (398, 187) and radius 69.
; PLAN: r0=232(x), r1=69(y), r2=87(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x), r6=187(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 69
LDI r2, 87
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 187
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
