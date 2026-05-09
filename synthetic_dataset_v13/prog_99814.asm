; DESCRIPTION: Places a purple 54x38 rectangle at position (210, 133).
; PLAN: r0=210(x), r1=133(y), r2=54(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 133
LDI r2, 54
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
