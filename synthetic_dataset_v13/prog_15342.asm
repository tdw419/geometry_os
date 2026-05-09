; DESCRIPTION: Draws a white rectangle at (87, 93) with width 23 and height 119.
; PLAN: r0=87(x), r1=93(y), r2=23(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 93
LDI r2, 23
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
