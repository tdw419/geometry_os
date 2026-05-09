; DESCRIPTION: Composite: Draws a white rectangle at (5, 231) with width 43 and height 12 then Places a black dot at position (470, 78).
; PLAN: r0=5(x), r1=231(y), r2=43(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=78(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 231
LDI r2, 43
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 78
LDI r7, 0x000000
PSET r5, r6, r7
HALT
