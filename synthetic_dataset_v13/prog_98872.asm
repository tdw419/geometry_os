; DESCRIPTION: Draws a cyan rectangle at (283, 233) with width 46 and height 15.
; PLAN: r0=283(x), r1=233(y), r2=46(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 233
LDI r2, 46
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
