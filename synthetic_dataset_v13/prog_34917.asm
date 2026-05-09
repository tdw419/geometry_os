; DESCRIPTION: Composite: Sets a single white pixel at (267, 110) then Renders a white box of size 48x61 starting at (200, 96) then Renders a magenta line between points (378, 130) and (120, 61).
; PLAN: r0=267(x), r1=110(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=96(y), r7=48(width), r8=61(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x1), r11=130(y1), r12=120(x2), r13=61(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 110
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 96
LDI r7, 48
LDI r8, 61
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 130
LDI r12, 120
LDI r13, 61
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
