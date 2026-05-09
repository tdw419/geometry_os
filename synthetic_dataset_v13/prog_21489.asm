; DESCRIPTION: Places a purple 61x41 rectangle at position (419, 33).
; PLAN: r0=419(x), r1=33(y), r2=61(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 33
LDI r2, 61
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
