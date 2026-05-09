; DESCRIPTION: Draws a black rectangle at (365, 139) with width 120 and height 70.
; PLAN: r0=365(x), r1=139(y), r2=120(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 139
LDI r2, 120
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
