; DESCRIPTION: Places a black 58x61 rectangle at position (160, 175).
; PLAN: r0=160(x), r1=175(y), r2=58(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 175
LDI r2, 58
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
