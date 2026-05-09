; DESCRIPTION: Draws a cyan rectangle at (204, 126) with width 117 and height 81.
; PLAN: r0=204(x), r1=126(y), r2=117(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 126
LDI r2, 117
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
