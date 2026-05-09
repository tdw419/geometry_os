; DESCRIPTION: Renders a blue box of size 15x57 starting at (161, 138).
; PLAN: r0=161(x), r1=138(y), r2=15(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 138
LDI r2, 15
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
