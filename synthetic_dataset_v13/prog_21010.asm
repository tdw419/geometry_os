; DESCRIPTION: Places a orange 114x12 rectangle at position (357, 92).
; PLAN: r0=357(x), r1=92(y), r2=114(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 92
LDI r2, 114
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
