; DESCRIPTION: Places a black 71x19 rectangle at position (379, 29).
; PLAN: r0=379(x), r1=29(y), r2=71(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 29
LDI r2, 71
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
