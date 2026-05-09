; DESCRIPTION: Renders a white box of size 46x103 starting at (228, 41).
; PLAN: r0=228(x), r1=41(y), r2=46(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 41
LDI r2, 46
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
