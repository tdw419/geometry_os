; DESCRIPTION: Renders a green box of size 41x82 starting at (305, 53).
; PLAN: r0=305(x), r1=53(y), r2=41(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 53
LDI r2, 41
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
