; DESCRIPTION: Draws a cyan rectangle at (66, 69) with width 39 and height 51.
; PLAN: r0=66(x), r1=69(y), r2=39(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 69
LDI r2, 39
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
