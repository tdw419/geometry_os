; DESCRIPTION: Renders a yellow box of size 105x76 starting at (16, 159).
; PLAN: r0=16(x), r1=159(y), r2=105(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 159
LDI r2, 105
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
