; DESCRIPTION: Places a black 89x59 rectangle at position (63, 54).
; PLAN: r0=63(x), r1=54(y), r2=89(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 54
LDI r2, 89
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
