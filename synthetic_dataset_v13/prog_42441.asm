; DESCRIPTION: Places a purple 50x34 rectangle at position (333, 32).
; PLAN: r0=333(x), r1=32(y), r2=50(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 32
LDI r2, 50
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
