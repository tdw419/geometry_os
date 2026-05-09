; DESCRIPTION: Renders a white box of size 117x83 starting at (260, 119).
; PLAN: r0=260(x), r1=119(y), r2=117(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 119
LDI r2, 117
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
