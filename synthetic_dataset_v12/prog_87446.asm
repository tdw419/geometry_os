; DESCRIPTION: Composite: Places a blue line segment connecting (477, 86) to (497, 192) then Places a cyan 34x26 rectangle at position (381, 102).
; PLAN: r0=477(x1), r1=86(y1), r2=497(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=102(y), r7=34(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 86
LDI r2, 497
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 102
LDI r7, 34
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
