; DESCRIPTION: Draws a cyan rectangle at (356, 123) with width 91 and height 52.
; PLAN: r0=356(x), r1=123(y), r2=91(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 123
LDI r2, 91
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
