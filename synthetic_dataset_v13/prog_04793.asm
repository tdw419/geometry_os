; DESCRIPTION: Places a purple 27x55 rectangle at position (419, 140).
; PLAN: r0=419(x), r1=140(y), r2=27(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 140
LDI r2, 27
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
