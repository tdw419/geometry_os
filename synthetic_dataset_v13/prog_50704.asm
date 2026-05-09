; DESCRIPTION: Places a black 105x100 rectangle at position (57, 55).
; PLAN: r0=57(x), r1=55(y), r2=105(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 55
LDI r2, 105
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
