; DESCRIPTION: Renders a white box of size 21x76 starting at (307, 41).
; PLAN: r0=307(x), r1=41(y), r2=21(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 41
LDI r2, 21
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
