; DESCRIPTION: Renders a green box of size 15x116 starting at (161, 122).
; PLAN: r0=161(x), r1=122(y), r2=15(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 122
LDI r2, 15
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
