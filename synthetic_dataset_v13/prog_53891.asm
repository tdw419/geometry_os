; DESCRIPTION: Places a blue 37x25 rectangle at position (124, 153).
; PLAN: r0=124(x), r1=153(y), r2=37(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 153
LDI r2, 37
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
