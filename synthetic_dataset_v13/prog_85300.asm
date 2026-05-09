; DESCRIPTION: Composite: Renders a white disk with center (414, 171) and radius 70 then Renders a orange box of size 81x77 starting at (261, 75) then Sets a single red pixel at (503, 79).
; PLAN: r0=414(x), r1=171(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=75(y), r7=81(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=503(x), r11=79(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 171
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 75
LDI r7, 81
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 79
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
