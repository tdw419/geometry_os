; DESCRIPTION: Places a black 106x64 rectangle at position (44, 149).
; PLAN: r0=44(x), r1=149(y), r2=106(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 149
LDI r2, 106
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
