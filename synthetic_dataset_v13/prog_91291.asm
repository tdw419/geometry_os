; DESCRIPTION: Composite: Creates a magenta rectangular region at (400, 21) spanning 49 by 82 pixels then Places a white line segment connecting (141, 81) to (153, 246).
; PLAN: r0=400(x), r1=21(y), r2=49(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x1), r6=81(y1), r7=153(x2), r8=246(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 21
LDI r2, 49
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 81
LDI r7, 153
LDI r8, 246
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
