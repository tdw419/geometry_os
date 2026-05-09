; DESCRIPTION: Places a white 43x58 rectangle at position (357, 1).
; PLAN: r0=357(x), r1=1(y), r2=43(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 1
LDI r2, 43
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
