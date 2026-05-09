; DESCRIPTION: Composite: Draws a blue rectangle at (250, 142) with width 79 and height 47 then Sets a single cyan pixel at (409, 178).
; PLAN: r0=250(x), r1=142(y), r2=79(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=178(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 142
LDI r2, 79
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 178
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
