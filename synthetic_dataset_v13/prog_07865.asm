; DESCRIPTION: Renders a yellow box of size 38x71 starting at (423, 76).
; PLAN: r0=423(x), r1=76(y), r2=38(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 76
LDI r2, 38
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
