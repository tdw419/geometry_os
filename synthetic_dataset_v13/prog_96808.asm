; DESCRIPTION: Composite: Creates a magenta rectangular region at (66, 77) spanning 48 by 39 pixels then Renders a purple line between points (13, 38) and (210, 33).
; PLAN: r0=66(x), r1=77(y), r2=48(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x1), r6=38(y1), r7=210(x2), r8=33(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 77
LDI r2, 48
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 38
LDI r7, 210
LDI r8, 33
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
