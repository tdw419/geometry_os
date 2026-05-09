; DESCRIPTION: Renders a white box of size 67x102 starting at (365, 149).
; PLAN: r0=365(x), r1=149(y), r2=67(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 149
LDI r2, 67
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
