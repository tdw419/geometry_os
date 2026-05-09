; DESCRIPTION: Places a blue 42x29 rectangle at position (369, 2).
; PLAN: r0=369(x), r1=2(y), r2=42(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 2
LDI r2, 42
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
