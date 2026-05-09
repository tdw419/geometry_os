; DESCRIPTION: Places a yellow 100x31 rectangle at position (125, 184).
; PLAN: r0=125(x), r1=184(y), r2=100(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 184
LDI r2, 100
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
