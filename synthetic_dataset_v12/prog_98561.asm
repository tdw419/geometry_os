; DESCRIPTION: Draws a cyan rectangle at (210, 156) with width 53 and height 56.
; PLAN: r0=210(x), r1=156(y), r2=53(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 156
LDI r2, 53
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
