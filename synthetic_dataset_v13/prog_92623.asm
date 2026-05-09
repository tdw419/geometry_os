; DESCRIPTION: Draws a cyan rectangle at (95, 219) with width 93 and height 34.
; PLAN: r0=95(x), r1=219(y), r2=93(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 219
LDI r2, 93
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
