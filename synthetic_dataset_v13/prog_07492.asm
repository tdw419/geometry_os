; DESCRIPTION: Composite: Sets a single magenta pixel at (461, 120) then Creates a red rectangular region at (224, 43) spanning 22 by 99 pixels then Renders a red line between points (150, 158) and (96, 44).
; PLAN: r0=461(x), r1=120(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=43(y), r7=22(width), r8=99(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x1), r11=158(y1), r12=96(x2), r13=44(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 120
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 43
LDI r7, 22
LDI r8, 99
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 158
LDI r12, 96
LDI r13, 44
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
