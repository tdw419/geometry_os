; DESCRIPTION: Renders a white box of size 96x33 starting at (299, 115).
; PLAN: r0=299(x), r1=115(y), r2=96(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 115
LDI r2, 96
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
