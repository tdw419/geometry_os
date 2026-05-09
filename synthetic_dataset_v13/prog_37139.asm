; DESCRIPTION: Places a purple 71x90 rectangle at position (178, 136).
; PLAN: r0=178(x), r1=136(y), r2=71(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 136
LDI r2, 71
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
