; DESCRIPTION: Places a black 88x111 rectangle at position (11, 124).
; PLAN: r0=11(x), r1=124(y), r2=88(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 124
LDI r2, 88
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
