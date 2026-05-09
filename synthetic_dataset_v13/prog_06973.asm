; DESCRIPTION: Renders a yellow box of size 18x35 starting at (429, 97).
; PLAN: r0=429(x), r1=97(y), r2=18(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 97
LDI r2, 18
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
