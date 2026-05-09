; DESCRIPTION: Places a purple 117x15 rectangle at position (210, 120).
; PLAN: r0=210(x), r1=120(y), r2=117(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 120
LDI r2, 117
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
