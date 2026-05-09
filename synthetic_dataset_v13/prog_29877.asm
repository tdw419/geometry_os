; DESCRIPTION: Composite: Sets a single red pixel at (111, 55) then Places a purple 23x69 rectangle at position (31, 28) then Places a red line segment connecting (36, 205) to (103, 204).
; PLAN: r0=111(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=31(x), r6=28(y), r7=23(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=36(x1), r11=205(y1), r12=103(x2), r13=204(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 55
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 31
LDI r6, 28
LDI r7, 23
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 205
LDI r12, 103
LDI r13, 204
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
