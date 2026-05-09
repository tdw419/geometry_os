; DESCRIPTION: Places a green 59x58 rectangle at position (397, 51).
; PLAN: r0=397(x), r1=51(y), r2=59(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 51
LDI r2, 59
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
