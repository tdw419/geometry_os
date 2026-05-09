; DESCRIPTION: Composite: Draws a blue rectangle at (226, 161) with width 38 and height 41 then Sets a single orange pixel at (358, 64).
; PLAN: r0=226(x), r1=161(y), r2=38(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=64(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 226
LDI r1, 161
LDI r2, 38
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 64
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
