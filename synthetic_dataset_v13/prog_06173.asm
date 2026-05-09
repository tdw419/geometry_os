; DESCRIPTION: Renders a white box of size 31x74 starting at (143, 104).
; PLAN: r0=143(x), r1=104(y), r2=31(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 104
LDI r2, 31
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
