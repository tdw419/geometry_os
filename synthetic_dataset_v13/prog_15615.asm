; DESCRIPTION: Composite: Renders a white line between points (489, 79) and (286, 25) then Creates a red rectangular region at (315, 68) spanning 120 by 112 pixels.
; PLAN: r0=489(x1), r1=79(y1), r2=286(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=68(y), r7=120(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 489
LDI r1, 79
LDI r2, 286
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 68
LDI r7, 120
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
