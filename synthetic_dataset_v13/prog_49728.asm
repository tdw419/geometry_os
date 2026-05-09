; DESCRIPTION: Renders a white box of size 89x59 starting at (282, 19).
; PLAN: r0=282(x), r1=19(y), r2=89(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 19
LDI r2, 89
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
