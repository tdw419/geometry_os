; DESCRIPTION: Renders a black box of size 94x27 starting at (191, 138).
; PLAN: r0=191(x), r1=138(y), r2=94(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 138
LDI r2, 94
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
