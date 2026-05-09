; DESCRIPTION: Renders a yellow box of size 70x73 starting at (234, 141).
; PLAN: r0=234(x), r1=141(y), r2=70(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 141
LDI r2, 70
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
