; DESCRIPTION: Renders a cyan box of size 31x41 starting at (140, 69).
; PLAN: r0=140(x), r1=69(y), r2=31(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 69
LDI r2, 31
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
