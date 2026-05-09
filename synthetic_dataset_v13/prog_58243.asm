; DESCRIPTION: Places a yellow 62x31 rectangle at position (136, 55).
; PLAN: r0=136(x), r1=55(y), r2=62(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 55
LDI r2, 62
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
