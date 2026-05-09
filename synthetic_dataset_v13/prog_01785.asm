; DESCRIPTION: Places a blue 62x47 rectangle at position (304, 90).
; PLAN: r0=304(x), r1=90(y), r2=62(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 90
LDI r2, 62
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
