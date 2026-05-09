; DESCRIPTION: Composite: Creates a blue rectangular region at (363, 125) spanning 14 by 29 pixels then Draws a white line from (441, 6) to (435, 7).
; PLAN: r0=363(x), r1=125(y), r2=14(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x1), r6=6(y1), r7=435(x2), r8=7(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 125
LDI r2, 14
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 6
LDI r7, 435
LDI r8, 7
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
