; DESCRIPTION: Places a white 33x93 rectangle at position (476, 4).
; PLAN: r0=476(x), r1=4(y), r2=33(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 4
LDI r2, 33
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
