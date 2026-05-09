; DESCRIPTION: Draws a cyan rectangle at (141, 137) with width 83 and height 24.
; PLAN: r0=141(x), r1=137(y), r2=83(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 137
LDI r2, 83
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
