; DESCRIPTION: Renders a white box of size 31x109 starting at (74, 18).
; PLAN: r0=74(x), r1=18(y), r2=31(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 18
LDI r2, 31
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
