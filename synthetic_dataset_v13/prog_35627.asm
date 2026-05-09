; DESCRIPTION: Draws a cyan rectangle at (308, 25) with width 108 and height 107.
; PLAN: r0=308(x), r1=25(y), r2=108(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 25
LDI r2, 108
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
