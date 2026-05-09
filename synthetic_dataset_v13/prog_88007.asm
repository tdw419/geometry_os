; DESCRIPTION: Places a black 68x84 rectangle at position (373, 76).
; PLAN: r0=373(x), r1=76(y), r2=68(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 76
LDI r2, 68
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
