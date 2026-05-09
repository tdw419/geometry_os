; DESCRIPTION: Places a black 83x35 rectangle at position (329, 55).
; PLAN: r0=329(x), r1=55(y), r2=83(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 55
LDI r2, 83
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
