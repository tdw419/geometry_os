; DESCRIPTION: Places a yellow 96x76 rectangle at position (129, 122).
; PLAN: r0=129(x), r1=122(y), r2=96(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 122
LDI r2, 96
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
