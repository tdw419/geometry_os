; DESCRIPTION: Renders a white box of size 41x53 starting at (321, 45).
; PLAN: r0=321(x), r1=45(y), r2=41(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 45
LDI r2, 41
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
