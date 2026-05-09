; DESCRIPTION: Draws a green rectangle at (223, 82) with width 98 and height 79.
; PLAN: r0=223(x), r1=82(y), r2=98(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 82
LDI r2, 98
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
