; DESCRIPTION: Places a black 33x114 rectangle at position (285, 60).
; PLAN: r0=285(x), r1=60(y), r2=33(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 60
LDI r2, 33
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
