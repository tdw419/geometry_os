; DESCRIPTION: Places a purple 54x61 rectangle at position (141, 16).
; PLAN: r0=141(x), r1=16(y), r2=54(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 16
LDI r2, 54
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
