; DESCRIPTION: Draws a cyan rectangle at (283, 188) with width 27 and height 39.
; PLAN: r0=283(x), r1=188(y), r2=27(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 188
LDI r2, 27
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
