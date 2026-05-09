; DESCRIPTION: Places a black 104x92 rectangle at position (36, 1).
; PLAN: r0=36(x), r1=1(y), r2=104(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 1
LDI r2, 104
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
