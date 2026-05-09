; DESCRIPTION: Renders a yellow box of size 24x76 starting at (383, 2).
; PLAN: r0=383(x), r1=2(y), r2=24(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 2
LDI r2, 24
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
