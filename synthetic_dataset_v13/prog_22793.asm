; DESCRIPTION: Composite: Draws a blue rectangle at (276, 47) with width 98 and height 29 then Places a orange dot at position (422, 211).
; PLAN: r0=276(x), r1=47(y), r2=98(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=211(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 47
LDI r2, 98
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 211
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
