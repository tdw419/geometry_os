; DESCRIPTION: Composite: Sets a single cyan pixel at (273, 124) then Draws a orange line from (233, 104) to (141, 36) then Places a magenta 20x81 rectangle at position (188, 42).
; PLAN: r0=273(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=233(x1), r6=104(y1), r7=141(x2), r8=36(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=42(y), r12=20(width), r13=81(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 104
LDI r7, 141
LDI r8, 36
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 42
LDI r12, 20
LDI r13, 81
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
