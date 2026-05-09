; DESCRIPTION: Places a blue 29x23 rectangle at position (209, 160).
; PLAN: r0=209(x), r1=160(y), r2=29(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 160
LDI r2, 29
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
