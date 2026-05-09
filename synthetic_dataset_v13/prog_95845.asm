; DESCRIPTION: Draws a cyan rectangle at (287, 124) with width 56 and height 114.
; PLAN: r0=287(x), r1=124(y), r2=56(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 124
LDI r2, 56
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
