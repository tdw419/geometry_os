; DESCRIPTION: Places a yellow 59x72 rectangle at position (321, 58).
; PLAN: r0=321(x), r1=58(y), r2=59(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 58
LDI r2, 59
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
