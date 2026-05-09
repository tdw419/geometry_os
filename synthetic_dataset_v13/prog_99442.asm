; DESCRIPTION: Draws a cyan rectangle at (143, 108) with width 51 and height 60.
; PLAN: r0=143(x), r1=108(y), r2=51(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 108
LDI r2, 51
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
