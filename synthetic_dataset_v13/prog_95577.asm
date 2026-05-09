; DESCRIPTION: Places a black 98x12 rectangle at position (52, 177).
; PLAN: r0=52(x), r1=177(y), r2=98(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 177
LDI r2, 98
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
