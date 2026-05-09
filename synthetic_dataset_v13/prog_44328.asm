; DESCRIPTION: Draws a cyan rectangle at (84, 140) with width 72 and height 112.
; PLAN: r0=84(x), r1=140(y), r2=72(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 140
LDI r2, 72
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
