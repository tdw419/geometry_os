; DESCRIPTION: Composite: Places a magenta 22x12 rectangle at position (488, 59) then Draws a orange line from (495, 174) to (400, 54) then Sets a single orange pixel at (27, 12).
; PLAN: r0=488(x), r1=59(y), r2=22(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x1), r6=174(y1), r7=400(x2), r8=54(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=27(x), r11=12(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 488
LDI r1, 59
LDI r2, 22
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 174
LDI r7, 400
LDI r8, 54
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 12
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
