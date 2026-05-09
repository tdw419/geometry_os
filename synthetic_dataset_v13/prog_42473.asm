; DESCRIPTION: Places a black 71x66 rectangle at position (214, 115).
; PLAN: r0=214(x), r1=115(y), r2=71(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 115
LDI r2, 71
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
