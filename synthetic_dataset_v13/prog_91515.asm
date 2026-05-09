; DESCRIPTION: Places a black 79x14 rectangle at position (138, 192).
; PLAN: r0=138(x), r1=192(y), r2=79(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 192
LDI r2, 79
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
