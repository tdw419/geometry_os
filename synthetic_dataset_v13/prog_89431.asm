; DESCRIPTION: Composite: Creates a orange circular shape at (330, 115) with radius 28 then Places a orange line segment connecting (101, 67) to (311, 68) then Sets a single cyan pixel at (233, 69).
; PLAN: r0=330(x), r1=115(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x1), r6=67(y1), r7=311(x2), r8=68(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=69(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 115
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 67
LDI r7, 311
LDI r8, 68
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 69
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
