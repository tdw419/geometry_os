; DESCRIPTION: Composite: Places a cyan dot at position (413, 25) then Draws a black circle centered at (117, 100) with radius 68 then Places a magenta line segment connecting (489, 192) to (81, 207).
; PLAN: r0=413(x), r1=25(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=100(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x1), r11=192(y1), r12=81(x2), r13=207(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 25
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 100
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 192
LDI r12, 81
LDI r13, 207
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
