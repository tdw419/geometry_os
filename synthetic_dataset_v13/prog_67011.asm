; DESCRIPTION: Places a orange 117x59 rectangle at position (321, 189).
; PLAN: r0=321(x), r1=189(y), r2=117(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 189
LDI r2, 117
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
