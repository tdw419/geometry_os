; DESCRIPTION: Draws a cyan rectangle at (377, 56) with width 33 and height 39.
; PLAN: r0=377(x), r1=56(y), r2=33(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 56
LDI r2, 33
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
