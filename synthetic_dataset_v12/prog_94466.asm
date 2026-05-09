; DESCRIPTION: Renders a green box of size 41x60 starting at (139, 40).
; PLAN: r0=139(x), r1=40(y), r2=41(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 40
LDI r2, 41
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
