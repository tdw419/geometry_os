; DESCRIPTION: Places a blue 114x92 rectangle at position (290, 64).
; PLAN: r0=290(x), r1=64(y), r2=114(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 64
LDI r2, 114
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
