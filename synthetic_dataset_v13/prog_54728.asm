; DESCRIPTION: Composite: Draws a blue rectangle at (173, 132) with width 107 and height 89 then Sets a single cyan pixel at (305, 42).
; PLAN: r0=173(x), r1=132(y), r2=107(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=42(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 132
LDI r2, 107
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 42
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
