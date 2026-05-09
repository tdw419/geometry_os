; DESCRIPTION: Places a magenta 75x40 rectangle at position (262, 119).
; PLAN: r0=262(x), r1=119(y), r2=75(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 119
LDI r2, 75
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
