; DESCRIPTION: Renders a green box of size 11x94 starting at (108, 73).
; PLAN: r0=108(x), r1=73(y), r2=11(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 73
LDI r2, 11
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
