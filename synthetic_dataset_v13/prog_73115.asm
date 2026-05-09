; DESCRIPTION: Renders a green box of size 55x82 starting at (367, 41).
; PLAN: r0=367(x), r1=41(y), r2=55(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 41
LDI r2, 55
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
