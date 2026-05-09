; DESCRIPTION: Renders a white box of size 53x99 starting at (99, 90).
; PLAN: r0=99(x), r1=90(y), r2=53(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 90
LDI r2, 53
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
