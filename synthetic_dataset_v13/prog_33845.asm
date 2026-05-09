; DESCRIPTION: Places a black 40x18 rectangle at position (234, 29).
; PLAN: r0=234(x), r1=29(y), r2=40(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 29
LDI r2, 40
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
