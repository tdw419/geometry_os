; DESCRIPTION: Places a blue 102x22 rectangle at position (178, 76).
; PLAN: r0=178(x), r1=76(y), r2=102(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 76
LDI r2, 102
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
