; DESCRIPTION: Draws a cyan rectangle at (61, 51) with width 97 and height 48.
; PLAN: r0=61(x), r1=51(y), r2=97(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 51
LDI r2, 97
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
