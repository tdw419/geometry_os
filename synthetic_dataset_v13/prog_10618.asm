; DESCRIPTION: Places a blue 15x100 rectangle at position (262, 73).
; PLAN: r0=262(x), r1=73(y), r2=15(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 73
LDI r2, 15
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
