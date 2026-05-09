; DESCRIPTION: Renders a white box of size 27x36 starting at (122, 149).
; PLAN: r0=122(x), r1=149(y), r2=27(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 149
LDI r2, 27
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
