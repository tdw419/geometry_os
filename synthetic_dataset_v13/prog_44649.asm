; DESCRIPTION: Places a purple 109x103 rectangle at position (292, 138).
; PLAN: r0=292(x), r1=138(y), r2=109(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 138
LDI r2, 109
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
