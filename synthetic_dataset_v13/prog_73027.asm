; DESCRIPTION: Draws a red rectangle at (273, 186) with width 26 and height 53.
; PLAN: r0=273(x), r1=186(y), r2=26(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 186
LDI r2, 26
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
