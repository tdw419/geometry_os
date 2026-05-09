; DESCRIPTION: Places a black 24x33 rectangle at position (7, 138).
; PLAN: r0=7(x), r1=138(y), r2=24(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 138
LDI r2, 24
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
