; DESCRIPTION: Renders a white box of size 68x28 starting at (18, 138).
; PLAN: r0=18(x), r1=138(y), r2=68(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 138
LDI r2, 68
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
