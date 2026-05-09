; DESCRIPTION: Places a blue 102x92 rectangle at position (262, 4).
; PLAN: r0=262(x), r1=4(y), r2=102(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 4
LDI r2, 102
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
