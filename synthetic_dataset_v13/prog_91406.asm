; DESCRIPTION: Places a black 59x65 rectangle at position (98, 77).
; PLAN: r0=98(x), r1=77(y), r2=59(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 77
LDI r2, 59
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
