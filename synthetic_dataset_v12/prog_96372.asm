; DESCRIPTION: Renders a yellow box of size 19x33 starting at (68, 187).
; PLAN: r0=68(x), r1=187(y), r2=19(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 187
LDI r2, 19
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
