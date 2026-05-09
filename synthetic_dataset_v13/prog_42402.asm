; DESCRIPTION: Places a black 44x85 rectangle at position (2, 25).
; PLAN: r0=2(x), r1=25(y), r2=44(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 25
LDI r2, 44
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
