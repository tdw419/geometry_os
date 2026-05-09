; DESCRIPTION: Renders a white box of size 118x28 starting at (100, 180).
; PLAN: r0=100(x), r1=180(y), r2=118(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 180
LDI r2, 118
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
