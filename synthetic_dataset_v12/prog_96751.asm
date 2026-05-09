; DESCRIPTION: Places a purple 48x68 rectangle at position (58, 168).
; PLAN: r0=58(x), r1=168(y), r2=48(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 168
LDI r2, 48
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
