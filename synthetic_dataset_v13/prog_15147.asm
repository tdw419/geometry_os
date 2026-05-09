; DESCRIPTION: Places a magenta 82x61 rectangle at position (57, 18).
; PLAN: r0=57(x), r1=18(y), r2=82(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 18
LDI r2, 82
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
