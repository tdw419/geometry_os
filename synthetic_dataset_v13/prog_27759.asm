; DESCRIPTION: Composite: Renders a magenta box of size 14x52 starting at (116, 103) then Sets a single white pixel at (462, 168) then Renders a blue line between points (495, 60) and (483, 93).
; PLAN: r0=116(x), r1=103(y), r2=14(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=168(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=495(x1), r11=60(y1), r12=483(x2), r13=93(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 103
LDI r2, 14
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 168
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 495
LDI r11, 60
LDI r12, 483
LDI r13, 93
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
