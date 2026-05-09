; DESCRIPTION: Composite: Sets a single purple pixel at (74, 130) then Creates a yellow rectangular region at (215, 112) spanning 14 by 106 pixels then Renders a orange line between points (336, 173) and (202, 163).
; PLAN: r0=74(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=112(y), r7=14(width), r8=106(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=336(x1), r11=173(y1), r12=202(x2), r13=163(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 130
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 112
LDI r7, 14
LDI r8, 106
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 173
LDI r12, 202
LDI r13, 163
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
