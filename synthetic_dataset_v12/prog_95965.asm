; DESCRIPTION: Places a purple 109x119 rectangle at position (178, 127).
; PLAN: r0=178(x), r1=127(y), r2=109(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 127
LDI r2, 109
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
