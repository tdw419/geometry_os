; DESCRIPTION: Places a magenta 27x99 rectangle at position (390, 31).
; PLAN: r0=390(x), r1=31(y), r2=27(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 31
LDI r2, 27
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
