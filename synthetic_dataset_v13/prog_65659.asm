; DESCRIPTION: Draws a cyan rectangle at (223, 30) with width 111 and height 119.
; PLAN: r0=223(x), r1=30(y), r2=111(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 30
LDI r2, 111
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
