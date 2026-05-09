; DESCRIPTION: Draws a white rectangle at (240, 82) with width 80 and height 75.
; PLAN: r0=240(x), r1=82(y), r2=80(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 82
LDI r2, 80
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
