; DESCRIPTION: Composite: Places a magenta line segment connecting (83, 191) to (274, 146) then Creates a yellow rectangular region at (44, 72) spanning 53 by 67 pixels.
; PLAN: r0=83(x1), r1=191(y1), r2=274(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=72(y), r7=53(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 191
LDI r2, 274
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 72
LDI r7, 53
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
