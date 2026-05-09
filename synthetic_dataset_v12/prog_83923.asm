; DESCRIPTION: Places a black 120x57 rectangle at position (194, 58).
; PLAN: r0=194(x), r1=58(y), r2=120(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 58
LDI r2, 120
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
