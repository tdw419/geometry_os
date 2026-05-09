; DESCRIPTION: Composite: Places a black 65x23 rectangle at position (76, 205) then Places a black line segment connecting (466, 114) to (310, 1).
; PLAN: r0=76(x), r1=205(y), r2=65(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x1), r6=114(y1), r7=310(x2), r8=1(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 205
LDI r2, 65
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 114
LDI r7, 310
LDI r8, 1
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
