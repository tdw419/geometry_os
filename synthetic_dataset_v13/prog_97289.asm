; DESCRIPTION: Places a orange 83x99 rectangle at position (204, 138).
; PLAN: r0=204(x), r1=138(y), r2=83(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 138
LDI r2, 83
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
