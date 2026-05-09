; DESCRIPTION: Draws a white rectangle at (363, 145) with width 113 and height 82.
; PLAN: r0=363(x), r1=145(y), r2=113(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 145
LDI r2, 113
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
