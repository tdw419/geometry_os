; DESCRIPTION: Places a purple 48x47 rectangle at position (100, 81).
; PLAN: r0=100(x), r1=81(y), r2=48(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 81
LDI r2, 48
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
