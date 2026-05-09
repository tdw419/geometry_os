; DESCRIPTION: Draws a cyan rectangle at (328, 93) with width 38 and height 105.
; PLAN: r0=328(x), r1=93(y), r2=38(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 93
LDI r2, 38
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
