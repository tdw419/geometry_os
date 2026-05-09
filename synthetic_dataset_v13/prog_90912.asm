; DESCRIPTION: Composite: Creates a red rectangular region at (226, 144) spanning 31 by 16 pixels then Renders a black line between points (28, 217) and (187, 223).
; PLAN: r0=226(x), r1=144(y), r2=31(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x1), r6=217(y1), r7=187(x2), r8=223(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 144
LDI r2, 31
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 217
LDI r7, 187
LDI r8, 223
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
