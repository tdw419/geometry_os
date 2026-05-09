; DESCRIPTION: Renders a blue box of size 33x63 starting at (171, 43).
; PLAN: r0=171(x), r1=43(y), r2=33(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 43
LDI r2, 33
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
