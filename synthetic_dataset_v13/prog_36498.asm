; DESCRIPTION: Composite: Draws a cyan rectangle at (400, 180) with width 62 and height 10 then Sets a single blue pixel at (23, 127).
; PLAN: r0=400(x), r1=180(y), r2=62(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=127(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 180
LDI r2, 62
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 127
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
