; DESCRIPTION: Places a black 54x59 rectangle at position (122, 66).
; PLAN: r0=122(x), r1=66(y), r2=54(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 66
LDI r2, 54
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
