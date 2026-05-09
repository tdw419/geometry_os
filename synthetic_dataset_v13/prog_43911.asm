; DESCRIPTION: Places a blue 22x60 rectangle at position (151, 18).
; PLAN: r0=151(x), r1=18(y), r2=22(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 18
LDI r2, 22
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
