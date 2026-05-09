; DESCRIPTION: Renders a green box of size 33x116 starting at (223, 81).
; PLAN: r0=223(x), r1=81(y), r2=33(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 81
LDI r2, 33
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
