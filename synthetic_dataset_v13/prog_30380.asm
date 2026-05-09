; DESCRIPTION: Places a blue 77x90 rectangle at position (13, 28).
; PLAN: r0=13(x), r1=28(y), r2=77(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 28
LDI r2, 77
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
