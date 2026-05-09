; DESCRIPTION: Places a blue 13x100 rectangle at position (357, 112).
; PLAN: r0=357(x), r1=112(y), r2=13(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 112
LDI r2, 13
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
