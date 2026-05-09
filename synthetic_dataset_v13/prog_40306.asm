; DESCRIPTION: Places a blue 62x90 rectangle at position (33, 57).
; PLAN: r0=33(x), r1=57(y), r2=62(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 57
LDI r2, 62
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
