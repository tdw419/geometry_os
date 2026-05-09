; DESCRIPTION: Places a purple 82x31 rectangle at position (369, 62).
; PLAN: r0=369(x), r1=62(y), r2=82(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 62
LDI r2, 82
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
