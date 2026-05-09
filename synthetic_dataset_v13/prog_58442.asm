; DESCRIPTION: Composite: Draws a green line from (354, 203) to (280, 20) then Creates a white rectangular region at (109, 138) spanning 101 by 24 pixels.
; PLAN: r0=354(x1), r1=203(y1), r2=280(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=138(y), r7=101(width), r8=24(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 203
LDI r2, 280
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 138
LDI r7, 101
LDI r8, 24
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
