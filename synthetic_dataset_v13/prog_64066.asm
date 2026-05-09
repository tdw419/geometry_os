; DESCRIPTION: Draws a cyan rectangle at (282, 204) with width 118 and height 44.
; PLAN: r0=282(x), r1=204(y), r2=118(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 204
LDI r2, 118
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
