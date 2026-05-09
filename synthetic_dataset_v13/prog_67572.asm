; DESCRIPTION: Places a black 10x25 rectangle at position (26, 172).
; PLAN: r0=26(x), r1=172(y), r2=10(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 172
LDI r2, 10
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
