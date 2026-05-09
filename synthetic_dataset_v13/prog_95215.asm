; DESCRIPTION: Composite: Places a black 97x13 rectangle at position (117, 0) then Places a black line segment connecting (11, 67) to (492, 156).
; PLAN: r0=117(x), r1=0(y), r2=97(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=67(y1), r7=492(x2), r8=156(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 0
LDI r2, 97
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 67
LDI r7, 492
LDI r8, 156
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
