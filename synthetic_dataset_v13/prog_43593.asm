; DESCRIPTION: Composite: Draws a black rectangle at (19, 53) with width 102 and height 95 then Places a cyan line segment connecting (419, 224) to (509, 26).
; PLAN: r0=19(x), r1=53(y), r2=102(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=224(y1), r7=509(x2), r8=26(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 53
LDI r2, 102
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 224
LDI r7, 509
LDI r8, 26
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
