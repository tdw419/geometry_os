; DESCRIPTION: Places a blue 57x82 rectangle at position (156, 140).
; PLAN: r0=156(x), r1=140(y), r2=57(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 140
LDI r2, 57
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
