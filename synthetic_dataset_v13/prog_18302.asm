; DESCRIPTION: Draws a cyan rectangle at (165, 11) with width 94 and height 115.
; PLAN: r0=165(x), r1=11(y), r2=94(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 11
LDI r2, 94
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
