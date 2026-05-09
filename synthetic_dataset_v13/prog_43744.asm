; DESCRIPTION: Renders a white box of size 53x73 starting at (126, 110).
; PLAN: r0=126(x), r1=110(y), r2=53(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 110
LDI r2, 53
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
