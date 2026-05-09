; DESCRIPTION: Places a purple 82x26 rectangle at position (412, 59).
; PLAN: r0=412(x), r1=59(y), r2=82(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 59
LDI r2, 82
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
