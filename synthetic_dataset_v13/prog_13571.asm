; DESCRIPTION: Places a black 118x55 rectangle at position (77, 60).
; PLAN: r0=77(x), r1=60(y), r2=118(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 60
LDI r2, 118
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
