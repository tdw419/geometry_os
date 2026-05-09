; DESCRIPTION: Composite: Places a magenta line segment connecting (265, 175) to (15, 140) then Creates a yellow rectangular region at (299, 129) spanning 28 by 21 pixels.
; PLAN: r0=265(x1), r1=175(y1), r2=15(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=129(y), r7=28(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 175
LDI r2, 15
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 129
LDI r7, 28
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
