; DESCRIPTION: Places a yellow 62x87 rectangle at position (219, 102).
; PLAN: r0=219(x), r1=102(y), r2=62(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 102
LDI r2, 62
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
