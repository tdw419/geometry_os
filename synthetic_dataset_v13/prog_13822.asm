; DESCRIPTION: Places a black 93x24 rectangle at position (414, 20).
; PLAN: r0=414(x), r1=20(y), r2=93(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 20
LDI r2, 93
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
