; DESCRIPTION: Draws a cyan rectangle at (452, 144) with width 44 and height 52.
; PLAN: r0=452(x), r1=144(y), r2=44(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 144
LDI r2, 44
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
