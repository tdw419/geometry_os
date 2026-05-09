; DESCRIPTION: Renders a white box of size 53x39 starting at (99, 165).
; PLAN: r0=99(x), r1=165(y), r2=53(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 165
LDI r2, 53
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
