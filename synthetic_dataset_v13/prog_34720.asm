; DESCRIPTION: Composite: Sets a single magenta pixel at (35, 130) then Creates a green rectangular region at (107, 106) spanning 47 by 38 pixels then Renders a red line between points (106, 133) and (174, 28).
; PLAN: r0=35(x), r1=130(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=106(y), r7=47(width), r8=38(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x1), r11=133(y1), r12=174(x2), r13=28(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 130
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 106
LDI r7, 47
LDI r8, 38
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 133
LDI r12, 174
LDI r13, 28
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
