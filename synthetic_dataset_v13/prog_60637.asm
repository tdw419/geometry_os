; DESCRIPTION: Composite: Sets a single yellow pixel at (35, 152) then Places a red 101x54 rectangle at position (214, 124) then Places a purple line segment connecting (87, 67) to (129, 246).
; PLAN: r0=35(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=124(y), r7=101(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=87(x1), r11=67(y1), r12=129(x2), r13=246(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 152
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 214
LDI r6, 124
LDI r7, 101
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 67
LDI r12, 129
LDI r13, 246
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
