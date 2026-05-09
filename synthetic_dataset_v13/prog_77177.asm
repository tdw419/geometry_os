; DESCRIPTION: Composite: Places a magenta line segment connecting (168, 136) to (103, 20) then Renders a magenta box of size 26x73 starting at (388, 160).
; PLAN: r0=168(x1), r1=136(y1), r2=103(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=160(y), r7=26(width), r8=73(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 136
LDI r2, 103
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 160
LDI r7, 26
LDI r8, 73
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
