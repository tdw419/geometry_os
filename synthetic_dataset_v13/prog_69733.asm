; DESCRIPTION: Composite: Creates a green rectangular region at (95, 148) spanning 73 by 64 pixels then Renders a magenta line between points (12, 218) and (421, 128).
; PLAN: r0=95(x), r1=148(y), r2=73(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=218(y1), r7=421(x2), r8=128(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 148
LDI r2, 73
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 218
LDI r7, 421
LDI r8, 128
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
