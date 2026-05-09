; DESCRIPTION: Renders a white box of size 82x41 starting at (381, 59).
; PLAN: r0=381(x), r1=59(y), r2=82(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 59
LDI r2, 82
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
