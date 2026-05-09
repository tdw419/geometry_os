; DESCRIPTION: Places a purple 113x81 rectangle at position (280, 142).
; PLAN: r0=280(x), r1=142(y), r2=113(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 142
LDI r2, 113
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
