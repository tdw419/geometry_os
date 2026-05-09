; DESCRIPTION: Draws a cyan rectangle at (140, 145) with width 37 and height 61.
; PLAN: r0=140(x), r1=145(y), r2=37(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 145
LDI r2, 37
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
