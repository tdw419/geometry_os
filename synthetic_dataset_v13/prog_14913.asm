; DESCRIPTION: Composite: Sets a single blue pixel at (140, 220) then Creates a magenta rectangular region at (372, 111) spanning 112 by 81 pixels then Renders a red line between points (247, 92) and (201, 100).
; PLAN: r0=140(x), r1=220(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=111(y), r7=112(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=247(x1), r11=92(y1), r12=201(x2), r13=100(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 220
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 111
LDI r7, 112
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 92
LDI r12, 201
LDI r13, 100
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
