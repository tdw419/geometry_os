; DESCRIPTION: Places a purple 56x57 rectangle at position (38, 138).
; PLAN: r0=38(x), r1=138(y), r2=56(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 138
LDI r2, 56
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
