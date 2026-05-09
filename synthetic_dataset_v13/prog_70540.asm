; DESCRIPTION: Places a yellow 68x55 rectangle at position (390, 43).
; PLAN: r0=390(x), r1=43(y), r2=68(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 43
LDI r2, 68
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
