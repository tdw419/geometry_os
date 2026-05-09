; DESCRIPTION: Composite: Draws a magenta rectangle at (208, 113) with width 85 and height 116 then Sets a single cyan pixel at (400, 186).
; PLAN: r0=208(x), r1=113(y), r2=85(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=186(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 208
LDI r1, 113
LDI r2, 85
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 186
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
