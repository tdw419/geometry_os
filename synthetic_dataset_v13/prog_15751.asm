; DESCRIPTION: Places a blue 67x110 rectangle at position (357, 129).
; PLAN: r0=357(x), r1=129(y), r2=67(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 129
LDI r2, 67
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
