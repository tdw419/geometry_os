; DESCRIPTION: Renders a white box of size 116x83 starting at (365, 25).
; PLAN: r0=365(x), r1=25(y), r2=116(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 25
LDI r2, 116
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
