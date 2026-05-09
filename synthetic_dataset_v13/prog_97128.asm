; DESCRIPTION: Places a yellow 71x69 rectangle at position (149, 176).
; PLAN: r0=149(x), r1=176(y), r2=71(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 176
LDI r2, 71
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
