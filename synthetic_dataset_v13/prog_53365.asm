; DESCRIPTION: Composite: Sets a single green pixel at (227, 203) then Places a cyan 39x75 rectangle at position (182, 148) then Places a green line segment connecting (47, 114) to (45, 101).
; PLAN: r0=227(x), r1=203(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=148(y), r7=39(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x1), r11=114(y1), r12=45(x2), r13=101(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 203
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 182
LDI r6, 148
LDI r7, 39
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 114
LDI r12, 45
LDI r13, 101
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
