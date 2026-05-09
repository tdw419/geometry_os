; DESCRIPTION: Composite: Places a orange circle of radius 53 at center (187, 203) then Places a black line segment connecting (69, 7) to (268, 233).
; PLAN: r0=187(x), r1=203(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x1), r6=7(y1), r7=268(x2), r8=233(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 203
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 7
LDI r7, 268
LDI r8, 233
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
