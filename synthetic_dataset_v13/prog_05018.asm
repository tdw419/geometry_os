; DESCRIPTION: Places a purple 16x34 rectangle at position (431, 190).
; PLAN: r0=431(x), r1=190(y), r2=16(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 190
LDI r2, 16
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
