; DESCRIPTION: Draws a cyan rectangle at (143, 33) with width 67 and height 63.
; PLAN: r0=143(x), r1=33(y), r2=67(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 33
LDI r2, 67
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
