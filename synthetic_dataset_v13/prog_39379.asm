; DESCRIPTION: Composite: Sets a single red pixel at (291, 208) then Creates a magenta rectangular region at (436, 102) spanning 42 by 100 pixels then Renders a red line between points (167, 227) and (168, 88).
; PLAN: r0=291(x), r1=208(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=102(y), r7=42(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x1), r11=227(y1), r12=168(x2), r13=88(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 208
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 436
LDI r6, 102
LDI r7, 42
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 227
LDI r12, 168
LDI r13, 88
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
