; DESCRIPTION: Places a yellow 53x55 rectangle at position (29, 176).
; PLAN: r0=29(x), r1=176(y), r2=53(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 176
LDI r2, 53
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
