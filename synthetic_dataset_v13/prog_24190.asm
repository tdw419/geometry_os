; DESCRIPTION: Places a orange 46x98 rectangle at position (138, 65).
; PLAN: r0=138(x), r1=65(y), r2=46(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 65
LDI r2, 46
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
