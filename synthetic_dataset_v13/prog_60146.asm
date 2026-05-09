; DESCRIPTION: Places a black 44x29 rectangle at position (366, 132).
; PLAN: r0=366(x), r1=132(y), r2=44(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 132
LDI r2, 44
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
