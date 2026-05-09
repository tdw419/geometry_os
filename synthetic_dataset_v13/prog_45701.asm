; DESCRIPTION: Composite: Creates a white rectangular region at (113, 96) spanning 78 by 82 pixels then Places a magenta line segment connecting (92, 235) to (332, 203).
; PLAN: r0=113(x), r1=96(y), r2=78(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=235(y1), r7=332(x2), r8=203(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 96
LDI r2, 78
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 235
LDI r7, 332
LDI r8, 203
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
