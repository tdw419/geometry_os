; DESCRIPTION: Places a purple 82x60 rectangle at position (168, 102).
; PLAN: r0=168(x), r1=102(y), r2=82(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 102
LDI r2, 82
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
