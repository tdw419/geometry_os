; DESCRIPTION: Composite: Renders a green line between points (357, 115) and (402, 134) then Creates a white rectangular region at (109, 11) spanning 70 by 61 pixels.
; PLAN: r0=357(x1), r1=115(y1), r2=402(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=11(y), r7=70(width), r8=61(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 115
LDI r2, 402
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 11
LDI r7, 70
LDI r8, 61
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
