; DESCRIPTION: Draws a cyan rectangle at (210, 29) with width 29 and height 118.
; PLAN: r0=210(x), r1=29(y), r2=29(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 29
LDI r2, 29
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
