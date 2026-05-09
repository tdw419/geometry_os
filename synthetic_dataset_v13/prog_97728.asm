; DESCRIPTION: Places a black 99x34 rectangle at position (19, 127).
; PLAN: r0=19(x), r1=127(y), r2=99(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 127
LDI r2, 99
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
