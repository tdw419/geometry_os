; DESCRIPTION: Places a orange 59x98 rectangle at position (129, 141).
; PLAN: r0=129(x), r1=141(y), r2=59(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 141
LDI r2, 59
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
