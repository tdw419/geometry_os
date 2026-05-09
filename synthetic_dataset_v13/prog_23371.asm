; DESCRIPTION: Renders a yellow box of size 41x93 starting at (442, 48).
; PLAN: r0=442(x), r1=48(y), r2=41(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 48
LDI r2, 41
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
