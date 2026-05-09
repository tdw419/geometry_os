; DESCRIPTION: Renders a green box of size 98x41 starting at (53, 174).
; PLAN: r0=53(x), r1=174(y), r2=98(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 174
LDI r2, 98
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
