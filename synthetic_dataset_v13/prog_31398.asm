; DESCRIPTION: Places a yellow 93x57 rectangle at position (282, 76).
; PLAN: r0=282(x), r1=76(y), r2=93(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 76
LDI r2, 93
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
