; DESCRIPTION: Composite: Sets a single black pixel at (487, 246) then Places a purple line segment connecting (25, 134) to (14, 59) then Places a red 11x26 rectangle at position (69, 22).
; PLAN: r0=487(x), r1=246(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=25(x1), r6=134(y1), r7=14(x2), r8=59(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=22(y), r12=11(width), r13=26(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 246
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 25
LDI r6, 134
LDI r7, 14
LDI r8, 59
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 22
LDI r12, 11
LDI r13, 26
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
