; DESCRIPTION: Renders a black box of size 33x43 starting at (443, 27).
; PLAN: r0=443(x), r1=27(y), r2=33(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 27
LDI r2, 33
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
