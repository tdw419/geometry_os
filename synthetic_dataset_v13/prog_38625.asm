; DESCRIPTION: Draws a cyan rectangle at (378, 107) with width 81 and height 50.
; PLAN: r0=378(x), r1=107(y), r2=81(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 107
LDI r2, 81
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
