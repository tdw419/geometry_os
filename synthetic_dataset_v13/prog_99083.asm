; DESCRIPTION: Draws a cyan rectangle at (383, 148) with width 47 and height 63.
; PLAN: r0=383(x), r1=148(y), r2=47(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 148
LDI r2, 47
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
