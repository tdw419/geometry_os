; DESCRIPTION: Composite: Creates a magenta rectangular region at (228, 57) spanning 31 by 42 pixels then Renders a blue line between points (163, 25) and (4, 77).
; PLAN: r0=228(x), r1=57(y), r2=31(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x1), r6=25(y1), r7=4(x2), r8=77(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 57
LDI r2, 31
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 25
LDI r7, 4
LDI r8, 77
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
