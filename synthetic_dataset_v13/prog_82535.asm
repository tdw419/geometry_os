; DESCRIPTION: Composite: Creates a green rectangular region at (445, 219) spanning 17 by 31 pixels then Renders a red line between points (492, 157) and (460, 73).
; PLAN: r0=445(x), r1=219(y), r2=17(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x1), r6=157(y1), r7=460(x2), r8=73(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 219
LDI r2, 17
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 157
LDI r7, 460
LDI r8, 73
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
