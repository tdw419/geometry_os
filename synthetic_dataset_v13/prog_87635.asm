; DESCRIPTION: Draws a cyan rectangle at (283, 204) with width 90 and height 36.
; PLAN: r0=283(x), r1=204(y), r2=90(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 204
LDI r2, 90
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
