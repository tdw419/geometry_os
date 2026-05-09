; DESCRIPTION: Composite: Draws a orange rectangle at (336, 108) with width 63 and height 99 then Sets a single blue pixel at (281, 37).
; PLAN: r0=336(x), r1=108(y), r2=63(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=37(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 108
LDI r2, 63
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 37
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
