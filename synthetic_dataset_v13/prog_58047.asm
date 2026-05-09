; DESCRIPTION: Renders a white box of size 93x60 starting at (53, 132).
; PLAN: r0=53(x), r1=132(y), r2=93(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 132
LDI r2, 93
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
