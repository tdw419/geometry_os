; DESCRIPTION: Renders a white box of size 119x27 starting at (383, 23).
; PLAN: r0=383(x), r1=23(y), r2=119(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 23
LDI r2, 119
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
