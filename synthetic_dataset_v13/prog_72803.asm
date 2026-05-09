; DESCRIPTION: Places a purple 59x61 rectangle at position (214, 30).
; PLAN: r0=214(x), r1=30(y), r2=59(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 30
LDI r2, 59
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
