; DESCRIPTION: Renders a white box of size 47x114 starting at (160, 119).
; PLAN: r0=160(x), r1=119(y), r2=47(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 119
LDI r2, 47
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
