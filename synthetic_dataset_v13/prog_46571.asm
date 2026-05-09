; DESCRIPTION: Places a black 109x29 rectangle at position (366, 192).
; PLAN: r0=366(x), r1=192(y), r2=109(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 192
LDI r2, 109
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
