; DESCRIPTION: Places a purple 95x62 rectangle at position (210, 96).
; PLAN: r0=210(x), r1=96(y), r2=95(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 96
LDI r2, 95
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
