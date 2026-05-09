; DESCRIPTION: Renders a white box of size 79x73 starting at (47, 38).
; PLAN: r0=47(x), r1=38(y), r2=79(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 38
LDI r2, 79
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
