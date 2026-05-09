; DESCRIPTION: Places a blue 59x69 rectangle at position (290, 160).
; PLAN: r0=290(x), r1=160(y), r2=59(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 160
LDI r2, 59
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
