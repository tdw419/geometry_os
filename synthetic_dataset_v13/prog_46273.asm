; DESCRIPTION: Composite: Sets a single orange pixel at (313, 203) then Places a yellow 12x89 rectangle at position (269, 48) then Places a magenta line segment connecting (414, 231) to (330, 30).
; PLAN: r0=313(x), r1=203(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=48(y), r7=12(width), r8=89(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x1), r11=231(y1), r12=330(x2), r13=30(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 203
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 269
LDI r6, 48
LDI r7, 12
LDI r8, 89
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 231
LDI r12, 330
LDI r13, 30
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
