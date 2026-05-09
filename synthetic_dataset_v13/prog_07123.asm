; DESCRIPTION: Renders a red box of size 24x81 starting at (409, 149).
; PLAN: r0=409(x), r1=149(y), r2=24(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 149
LDI r2, 24
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
