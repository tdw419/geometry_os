; DESCRIPTION: Composite: Creates a blue rectangular region at (93, 202) spanning 118 by 42 pixels then Renders a blue line between points (355, 151) and (224, 152).
; PLAN: r0=93(x), r1=202(y), r2=118(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=151(y1), r7=224(x2), r8=152(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 202
LDI r2, 118
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 151
LDI r7, 224
LDI r8, 152
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
