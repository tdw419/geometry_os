; DESCRIPTION: Places a orange 119x108 rectangle at position (204, 103).
; PLAN: r0=204(x), r1=103(y), r2=119(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 103
LDI r2, 119
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
