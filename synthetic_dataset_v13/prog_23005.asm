; DESCRIPTION: Places a black 99x74 rectangle at position (324, 175).
; PLAN: r0=324(x), r1=175(y), r2=99(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 175
LDI r2, 99
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
