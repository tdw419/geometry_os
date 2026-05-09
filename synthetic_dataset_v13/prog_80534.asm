; DESCRIPTION: Places a purple 54x87 rectangle at position (168, 167).
; PLAN: r0=168(x), r1=167(y), r2=54(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 167
LDI r2, 54
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
