; DESCRIPTION: Renders a white box of size 31x115 starting at (3, 90).
; PLAN: r0=3(x), r1=90(y), r2=31(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 90
LDI r2, 31
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
