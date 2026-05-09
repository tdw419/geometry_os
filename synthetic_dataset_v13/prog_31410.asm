; DESCRIPTION: Composite: Draws a blue rectangle at (211, 117) with width 103 and height 40 then Places a cyan dot at position (207, 119).
; PLAN: r0=211(x), r1=117(y), r2=103(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=119(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 117
LDI r2, 103
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 119
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
