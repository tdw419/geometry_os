; DESCRIPTION: Places a purple 38x32 rectangle at position (168, 133).
; PLAN: r0=168(x), r1=133(y), r2=38(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 133
LDI r2, 38
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
