; DESCRIPTION: Places a black 52x82 rectangle at position (12, 164).
; PLAN: r0=12(x), r1=164(y), r2=52(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 164
LDI r2, 52
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
