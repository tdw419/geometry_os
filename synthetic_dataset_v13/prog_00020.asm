; DESCRIPTION: Draws a cyan rectangle at (351, 107) with width 53 and height 51.
; PLAN: r0=351(x), r1=107(y), r2=53(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 107
LDI r2, 53
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
