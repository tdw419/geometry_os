; DESCRIPTION: Places a blue 61x51 rectangle at position (397, 173).
; PLAN: r0=397(x), r1=173(y), r2=61(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 173
LDI r2, 61
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
