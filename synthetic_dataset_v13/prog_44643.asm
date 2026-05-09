; DESCRIPTION: Places a blue 58x33 rectangle at position (337, 210).
; PLAN: r0=337(x), r1=210(y), r2=58(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 210
LDI r2, 58
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
