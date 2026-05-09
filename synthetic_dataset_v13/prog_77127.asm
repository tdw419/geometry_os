; DESCRIPTION: Places a purple 95x89 rectangle at position (189, 120).
; PLAN: r0=189(x), r1=120(y), r2=95(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 120
LDI r2, 95
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
