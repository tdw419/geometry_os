; DESCRIPTION: Places a purple 102x79 rectangle at position (327, 59).
; PLAN: r0=327(x), r1=59(y), r2=102(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 59
LDI r2, 102
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
