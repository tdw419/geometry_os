; DESCRIPTION: Composite: Places a green line segment connecting (426, 81) to (68, 99) then Creates a red rectangular region at (83, 9) spanning 77 by 116 pixels.
; PLAN: r0=426(x1), r1=81(y1), r2=68(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=9(y), r7=77(width), r8=116(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 81
LDI r2, 68
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 9
LDI r7, 77
LDI r8, 116
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
