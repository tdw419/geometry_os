; DESCRIPTION: Composite: Creates a black rectangular region at (349, 109) spanning 58 by 50 pixels then Renders a cyan line between points (511, 219) and (73, 92).
; PLAN: r0=349(x), r1=109(y), r2=58(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x1), r6=219(y1), r7=73(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 109
LDI r2, 58
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 219
LDI r7, 73
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
