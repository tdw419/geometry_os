; DESCRIPTION: Draws a cyan rectangle at (51, 61) with width 70 and height 79.
; PLAN: r0=51(x), r1=61(y), r2=70(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 61
LDI r2, 70
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
