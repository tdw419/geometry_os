; DESCRIPTION: Renders a white box of size 90x18 starting at (10, 19).
; PLAN: r0=10(x), r1=19(y), r2=90(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 19
LDI r2, 90
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
