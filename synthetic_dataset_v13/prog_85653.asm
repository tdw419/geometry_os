; DESCRIPTION: Places a orange 46x92 rectangle at position (337, 129).
; PLAN: r0=337(x), r1=129(y), r2=46(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 129
LDI r2, 46
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
