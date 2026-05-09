; DESCRIPTION: Places a blue 66x49 rectangle at position (369, 153).
; PLAN: r0=369(x), r1=153(y), r2=66(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 153
LDI r2, 66
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
