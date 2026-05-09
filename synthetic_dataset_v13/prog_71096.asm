; DESCRIPTION: Draws a cyan rectangle at (274, 142) with width 52 and height 16.
; PLAN: r0=274(x), r1=142(y), r2=52(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 142
LDI r2, 52
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
