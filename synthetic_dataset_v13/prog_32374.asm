; DESCRIPTION: Draws a cyan rectangle at (212, 63) with width 81 and height 120.
; PLAN: r0=212(x), r1=63(y), r2=81(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 63
LDI r2, 81
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
