; DESCRIPTION: Renders a white box of size 46x34 starting at (18, 112).
; PLAN: r0=18(x), r1=112(y), r2=46(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 112
LDI r2, 46
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
