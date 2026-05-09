; DESCRIPTION: Places a black 83x69 rectangle at position (192, 186).
; PLAN: r0=192(x), r1=186(y), r2=83(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 186
LDI r2, 83
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
