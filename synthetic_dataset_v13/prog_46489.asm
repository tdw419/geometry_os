; DESCRIPTION: Renders a white box of size 53x57 starting at (278, 105).
; PLAN: r0=278(x), r1=105(y), r2=53(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 105
LDI r2, 53
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
