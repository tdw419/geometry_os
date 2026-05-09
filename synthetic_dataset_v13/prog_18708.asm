; DESCRIPTION: Draws a cyan rectangle at (172, 50) with width 55 and height 81.
; PLAN: r0=172(x), r1=50(y), r2=55(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 50
LDI r2, 55
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
