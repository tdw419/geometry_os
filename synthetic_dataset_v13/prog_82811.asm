; DESCRIPTION: Draws a white rectangle at (317, 87) with width 62 and height 68.
; PLAN: r0=317(x), r1=87(y), r2=62(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 87
LDI r2, 62
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
