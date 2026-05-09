; DESCRIPTION: Places a black 39x116 rectangle at position (110, 81).
; PLAN: r0=110(x), r1=81(y), r2=39(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 81
LDI r2, 39
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
