; DESCRIPTION: Renders a yellow box of size 23x55 starting at (238, 179).
; PLAN: r0=238(x), r1=179(y), r2=23(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 179
LDI r2, 23
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
