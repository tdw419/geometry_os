; DESCRIPTION: Composite: Draws a blue rectangle at (335, 112) with width 88 and height 116 then Sets a single red pixel at (229, 113).
; PLAN: r0=335(x), r1=112(y), r2=88(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=113(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 112
LDI r2, 88
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 113
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
