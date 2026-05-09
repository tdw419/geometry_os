; DESCRIPTION: Draws a white rectangle at (82, 89) with width 100 and height 91.
; PLAN: r0=82(x), r1=89(y), r2=100(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 89
LDI r2, 100
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
