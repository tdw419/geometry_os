; DESCRIPTION: Renders a blue box of size 21x107 starting at (249, 69).
; PLAN: r0=249(x), r1=69(y), r2=21(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 69
LDI r2, 21
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
