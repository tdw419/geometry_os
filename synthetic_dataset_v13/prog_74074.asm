; DESCRIPTION: Places a purple 105x59 rectangle at position (252, 47).
; PLAN: r0=252(x), r1=47(y), r2=105(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 47
LDI r2, 105
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
