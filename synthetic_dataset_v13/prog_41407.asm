; DESCRIPTION: Composite: Creates a red rectangular region at (53, 196) spanning 86 by 21 pixels then Renders a red line between points (332, 71) and (182, 163).
; PLAN: r0=53(x), r1=196(y), r2=86(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=71(y1), r7=182(x2), r8=163(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 196
LDI r2, 86
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 71
LDI r7, 182
LDI r8, 163
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
