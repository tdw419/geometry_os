; DESCRIPTION: Draws a cyan rectangle at (400, 145) with width 76 and height 107.
; PLAN: r0=400(x), r1=145(y), r2=76(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 145
LDI r2, 76
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
