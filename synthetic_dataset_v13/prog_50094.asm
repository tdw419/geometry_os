; DESCRIPTION: Renders a yellow box of size 56x43 starting at (367, 165).
; PLAN: r0=367(x), r1=165(y), r2=56(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 165
LDI r2, 56
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
