; DESCRIPTION: Places a blue 30x91 rectangle at position (191, 31).
; PLAN: r0=191(x), r1=31(y), r2=30(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 31
LDI r2, 30
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
