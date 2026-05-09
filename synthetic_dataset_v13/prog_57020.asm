; DESCRIPTION: Renders a white box of size 46x76 starting at (113, 100).
; PLAN: r0=113(x), r1=100(y), r2=46(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 100
LDI r2, 46
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
