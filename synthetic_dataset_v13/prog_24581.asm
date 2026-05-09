; DESCRIPTION: Renders a green box of size 112x71 starting at (161, 76).
; PLAN: r0=161(x), r1=76(y), r2=112(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 76
LDI r2, 112
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
