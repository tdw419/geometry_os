; DESCRIPTION: Draws a white rectangle at (193, 55) with width 50 and height 22.
; PLAN: r0=193(x), r1=55(y), r2=50(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 55
LDI r2, 50
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
