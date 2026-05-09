; DESCRIPTION: Places a purple 59x95 rectangle at position (112, 142).
; PLAN: r0=112(x), r1=142(y), r2=59(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 142
LDI r2, 59
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
