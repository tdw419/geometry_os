; DESCRIPTION: Draws a cyan rectangle at (323, 53) with width 75 and height 84.
; PLAN: r0=323(x), r1=53(y), r2=75(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 53
LDI r2, 75
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
