; DESCRIPTION: Places a blue 37x54 rectangle at position (322, 68).
; PLAN: r0=322(x), r1=68(y), r2=37(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 68
LDI r2, 37
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
