; DESCRIPTION: Draws a cyan rectangle at (463, 211) with width 27 and height 29.
; PLAN: r0=463(x), r1=211(y), r2=27(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 211
LDI r2, 27
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
