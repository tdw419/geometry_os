; DESCRIPTION: Draws a white rectangle at (135, 87) with width 65 and height 98.
; PLAN: r0=135(x), r1=87(y), r2=65(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 87
LDI r2, 65
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
