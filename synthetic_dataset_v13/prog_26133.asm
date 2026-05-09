; DESCRIPTION: Composite: Creates a magenta rectangular region at (92, 151) spanning 103 by 64 pixels then Renders a white line between points (319, 143) and (24, 196).
; PLAN: r0=92(x), r1=151(y), r2=103(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=143(y1), r7=24(x2), r8=196(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 151
LDI r2, 103
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 143
LDI r7, 24
LDI r8, 196
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
