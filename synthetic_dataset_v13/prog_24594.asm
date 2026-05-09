; DESCRIPTION: Composite: Draws a cyan rectangle at (287, 122) with width 79 and height 46 then Places a orange dot at position (350, 12).
; PLAN: r0=287(x), r1=122(y), r2=79(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=12(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 122
LDI r2, 79
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 12
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
