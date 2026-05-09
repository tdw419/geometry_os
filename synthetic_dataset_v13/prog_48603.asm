; DESCRIPTION: Renders a yellow box of size 98x19 starting at (166, 69).
; PLAN: r0=166(x), r1=69(y), r2=98(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 69
LDI r2, 98
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
