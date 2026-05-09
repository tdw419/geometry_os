; DESCRIPTION: Places a black 105x65 rectangle at position (59, 132).
; PLAN: r0=59(x), r1=132(y), r2=105(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 132
LDI r2, 105
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
