; DESCRIPTION: Renders a yellow box of size 60x76 starting at (310, 157).
; PLAN: r0=310(x), r1=157(y), r2=60(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 157
LDI r2, 60
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
