; DESCRIPTION: Places a purple 61x53 rectangle at position (106, 144).
; PLAN: r0=106(x), r1=144(y), r2=61(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 144
LDI r2, 61
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
