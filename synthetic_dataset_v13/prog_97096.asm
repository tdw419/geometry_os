; DESCRIPTION: Draws a cyan rectangle at (74, 132) with width 111 and height 119.
; PLAN: r0=74(x), r1=132(y), r2=111(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 132
LDI r2, 111
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
