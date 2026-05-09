; DESCRIPTION: Places a green 15x108 rectangle at position (274, 137).
; PLAN: r0=274(x), r1=137(y), r2=15(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 137
LDI r2, 15
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
