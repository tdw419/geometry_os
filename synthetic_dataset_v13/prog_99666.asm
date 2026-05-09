; DESCRIPTION: Places a black 82x12 rectangle at position (219, 177).
; PLAN: r0=219(x), r1=177(y), r2=82(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 177
LDI r2, 82
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
