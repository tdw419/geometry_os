; DESCRIPTION: Composite: Creates a red rectangular region at (172, 59) spanning 43 by 96 pixels then Renders a black line between points (263, 73) and (9, 226).
; PLAN: r0=172(x), r1=59(y), r2=43(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x1), r6=73(y1), r7=9(x2), r8=226(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 59
LDI r2, 43
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 73
LDI r7, 9
LDI r8, 226
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
