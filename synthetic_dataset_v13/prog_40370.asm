; DESCRIPTION: Composite: Draws a blue rectangle at (72, 52) with width 47 and height 61 then Sets a single orange pixel at (300, 132).
; PLAN: r0=72(x), r1=52(y), r2=47(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=132(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 52
LDI r2, 47
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 132
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
