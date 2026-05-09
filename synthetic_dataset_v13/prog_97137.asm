; DESCRIPTION: Places a purple 73x26 rectangle at position (335, 161).
; PLAN: r0=335(x), r1=161(y), r2=73(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 161
LDI r2, 73
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
