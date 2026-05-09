; DESCRIPTION: Places a black 99x17 rectangle at position (170, 57).
; PLAN: r0=170(x), r1=57(y), r2=99(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 57
LDI r2, 99
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
