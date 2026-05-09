; DESCRIPTION: Places a black 52x111 rectangle at position (449, 0).
; PLAN: r0=449(x), r1=0(y), r2=52(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 0
LDI r2, 52
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
