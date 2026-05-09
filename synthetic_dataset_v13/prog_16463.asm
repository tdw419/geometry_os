; DESCRIPTION: Draws a cyan rectangle at (253, 184) with width 73 and height 60.
; PLAN: r0=253(x), r1=184(y), r2=73(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 184
LDI r2, 73
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
