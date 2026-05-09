; DESCRIPTION: Renders a yellow box of size 37x73 starting at (69, 157).
; PLAN: r0=69(x), r1=157(y), r2=37(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 157
LDI r2, 37
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
