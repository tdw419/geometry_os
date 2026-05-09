; DESCRIPTION: Composite: Sets a single yellow pixel at (454, 90) then Places a magenta line segment connecting (403, 116) to (11, 67) then Places a green circle of radius 67 at center (156, 170).
; PLAN: r0=454(x), r1=90(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=403(x1), r6=116(y1), r7=11(x2), r8=67(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=170(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 90
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 403
LDI r6, 116
LDI r7, 11
LDI r8, 67
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 170
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
