; DESCRIPTION: Renders a white box of size 120x117 starting at (233, 119).
; PLAN: r0=233(x), r1=119(y), r2=120(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 119
LDI r2, 120
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
