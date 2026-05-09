; DESCRIPTION: Renders a white box of size 33x41 starting at (291, 4).
; PLAN: r0=291(x), r1=4(y), r2=33(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 4
LDI r2, 33
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
