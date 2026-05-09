; DESCRIPTION: Composite: Creates a white rectangular region at (156, 116) spanning 108 by 119 pixels then Renders a blue line between points (167, 129) and (247, 15).
; PLAN: r0=156(x), r1=116(y), r2=108(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x1), r6=129(y1), r7=247(x2), r8=15(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 116
LDI r2, 108
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 129
LDI r7, 247
LDI r8, 15
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
