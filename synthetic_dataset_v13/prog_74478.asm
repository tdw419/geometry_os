; DESCRIPTION: Draws a cyan rectangle at (70, 62) with width 115 and height 75.
; PLAN: r0=70(x), r1=62(y), r2=115(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 62
LDI r2, 115
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
