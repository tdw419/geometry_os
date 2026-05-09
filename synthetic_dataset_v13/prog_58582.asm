; DESCRIPTION: Draws a cyan rectangle at (378, 23) with width 117 and height 60.
; PLAN: r0=378(x), r1=23(y), r2=117(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 23
LDI r2, 117
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
