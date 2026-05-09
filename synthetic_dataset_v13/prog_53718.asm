; DESCRIPTION: Composite: Places a orange 62x69 rectangle at position (199, 91) then Places a cyan line segment connecting (139, 233) to (67, 253).
; PLAN: r0=199(x), r1=91(y), r2=62(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x1), r6=233(y1), r7=67(x2), r8=253(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 91
LDI r2, 62
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 233
LDI r7, 67
LDI r8, 253
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
