; DESCRIPTION: Draws a cyan rectangle at (93, 4) with width 98 and height 120.
; PLAN: r0=93(x), r1=4(y), r2=98(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 4
LDI r2, 98
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
