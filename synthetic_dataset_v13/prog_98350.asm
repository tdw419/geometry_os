; DESCRIPTION: Places a magenta 57x43 rectangle at position (321, 103).
; PLAN: r0=321(x), r1=103(y), r2=57(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 103
LDI r2, 57
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
