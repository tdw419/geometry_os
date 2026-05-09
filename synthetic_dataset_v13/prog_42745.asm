; DESCRIPTION: Renders a white box of size 120x53 starting at (309, 196).
; PLAN: r0=309(x), r1=196(y), r2=120(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 196
LDI r2, 120
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
