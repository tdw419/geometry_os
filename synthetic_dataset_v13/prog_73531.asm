; DESCRIPTION: Places a yellow 39x56 rectangle at position (134, 185).
; PLAN: r0=134(x), r1=185(y), r2=39(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 185
LDI r2, 39
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
