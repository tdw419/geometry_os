; DESCRIPTION: Draws a cyan rectangle at (193, 137) with width 112 and height 38.
; PLAN: r0=193(x), r1=137(y), r2=112(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 137
LDI r2, 112
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
