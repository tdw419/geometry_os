; DESCRIPTION: Draws a cyan rectangle at (251, 142) with width 68 and height 85.
; PLAN: r0=251(x), r1=142(y), r2=68(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 142
LDI r2, 68
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
