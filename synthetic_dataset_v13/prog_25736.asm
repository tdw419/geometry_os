; DESCRIPTION: Composite: Creates a purple rectangular region at (346, 24) spanning 83 by 10 pixels then Renders a white line between points (419, 0) and (289, 175).
; PLAN: r0=346(x), r1=24(y), r2=83(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=0(y1), r7=289(x2), r8=175(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 24
LDI r2, 83
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 0
LDI r7, 289
LDI r8, 175
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
