; DESCRIPTION: Composite: Creates a green rectangular region at (119, 45) spanning 78 by 93 pixels then Renders a cyan line between points (419, 219) and (209, 229).
; PLAN: r0=119(x), r1=45(y), r2=78(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=219(y1), r7=209(x2), r8=229(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 45
LDI r2, 78
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 219
LDI r7, 209
LDI r8, 229
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
