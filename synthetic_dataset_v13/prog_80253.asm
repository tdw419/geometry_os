; DESCRIPTION: Places a magenta 73x120 rectangle at position (90, 115).
; PLAN: r0=90(x), r1=115(y), r2=73(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 115
LDI r2, 73
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
