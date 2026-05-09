; DESCRIPTION: Composite: Places a blue circle of radius 58 at center (74, 169) then Creates a green rectangular region at (187, 23) spanning 67 by 54 pixels.
; PLAN: r0=74(x), r1=169(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=187(x), r6=23(y), r7=67(width), r8=54(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 169
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 187
LDI r6, 23
LDI r7, 67
LDI r8, 54
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
