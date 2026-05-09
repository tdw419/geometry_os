; DESCRIPTION: Renders a white box of size 100x24 starting at (79, 14).
; PLAN: r0=79(x), r1=14(y), r2=100(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 14
LDI r2, 100
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
