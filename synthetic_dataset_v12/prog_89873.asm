; DESCRIPTION: Places a black 28x25 rectangle at position (15, 73).
; PLAN: r0=15(x), r1=73(y), r2=28(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 73
LDI r2, 28
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
