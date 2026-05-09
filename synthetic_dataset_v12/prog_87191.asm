; DESCRIPTION: Composite: Draws a orange rectangle at (223, 107) with width 85 and height 80 then Sets a single black pixel at (180, 226).
; PLAN: r0=223(x), r1=107(y), r2=85(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=226(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 107
LDI r2, 85
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 226
LDI r7, 0x000000
PSET r5, r6, r7
HALT
