; DESCRIPTION: Renders a yellow box of size 70x98 starting at (299, 35).
; PLAN: r0=299(x), r1=35(y), r2=70(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 35
LDI r2, 70
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
