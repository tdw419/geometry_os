; DESCRIPTION: Draws a green rectangle at (273, 161) with width 82 and height 74.
; PLAN: r0=273(x), r1=161(y), r2=82(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 161
LDI r2, 82
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
