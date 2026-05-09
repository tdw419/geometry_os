; DESCRIPTION: Places a blue 72x60 rectangle at position (322, 93).
; PLAN: r0=322(x), r1=93(y), r2=72(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 93
LDI r2, 72
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
