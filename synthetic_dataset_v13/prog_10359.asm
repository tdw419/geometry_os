; DESCRIPTION: Renders a white box of size 41x50 starting at (127, 68).
; PLAN: r0=127(x), r1=68(y), r2=41(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 68
LDI r2, 41
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
