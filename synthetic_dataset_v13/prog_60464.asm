; DESCRIPTION: Renders a yellow box of size 88x13 starting at (268, 243).
; PLAN: r0=268(x), r1=243(y), r2=88(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 243
LDI r2, 88
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
