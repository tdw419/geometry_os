; DESCRIPTION: Places a purple 61x72 rectangle at position (265, 24).
; PLAN: r0=265(x), r1=24(y), r2=61(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 24
LDI r2, 61
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
