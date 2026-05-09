; DESCRIPTION: Places a yellow 46x93 rectangle at position (357, 78).
; PLAN: r0=357(x), r1=78(y), r2=46(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 78
LDI r2, 46
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
