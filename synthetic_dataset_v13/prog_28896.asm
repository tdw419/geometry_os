; DESCRIPTION: Places a black 15x81 rectangle at position (135, 61).
; PLAN: r0=135(x), r1=61(y), r2=15(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 61
LDI r2, 15
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
