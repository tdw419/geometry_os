; DESCRIPTION: Places a purple 93x25 rectangle at position (29, 112).
; PLAN: r0=29(x), r1=112(y), r2=93(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 112
LDI r2, 93
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
