; DESCRIPTION: Draws a cyan rectangle at (283, 132) with width 33 and height 108.
; PLAN: r0=283(x), r1=132(y), r2=33(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 132
LDI r2, 33
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
