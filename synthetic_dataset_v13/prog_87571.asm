; DESCRIPTION: Places a yellow 53x77 rectangle at position (431, 23).
; PLAN: r0=431(x), r1=23(y), r2=53(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 23
LDI r2, 53
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
