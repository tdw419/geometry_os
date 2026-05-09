; DESCRIPTION: Composite: Creates a white rectangular region at (218, 120) spanning 34 by 76 pixels then Renders a white line between points (402, 38) and (370, 155).
; PLAN: r0=218(x), r1=120(y), r2=34(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=38(y1), r7=370(x2), r8=155(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 120
LDI r2, 34
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 38
LDI r7, 370
LDI r8, 155
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
