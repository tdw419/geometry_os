; DESCRIPTION: Renders a yellow box of size 76x98 starting at (138, 128).
; PLAN: r0=138(x), r1=128(y), r2=76(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 128
LDI r2, 76
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
