; DESCRIPTION: Renders a yellow box of size 107x54 starting at (115, 69).
; PLAN: r0=115(x), r1=69(y), r2=107(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 69
LDI r2, 107
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
