; DESCRIPTION: Places a yellow 71x103 rectangle at position (115, 100).
; PLAN: r0=115(x), r1=100(y), r2=71(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 100
LDI r2, 71
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
