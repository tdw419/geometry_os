; DESCRIPTION: Places a purple 90x34 rectangle at position (61, 220).
; PLAN: r0=61(x), r1=220(y), r2=90(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 220
LDI r2, 90
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
