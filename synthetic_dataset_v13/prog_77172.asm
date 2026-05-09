; DESCRIPTION: Places a blue 110x56 rectangle at position (356, 107).
; PLAN: r0=356(x), r1=107(y), r2=110(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 107
LDI r2, 110
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
