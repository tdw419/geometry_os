; DESCRIPTION: Draws a white rectangle at (365, 131) with width 99 and height 35.
; PLAN: r0=365(x), r1=131(y), r2=99(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 131
LDI r2, 99
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
