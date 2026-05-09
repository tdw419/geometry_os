; DESCRIPTION: Places a black 23x92 rectangle at position (173, 51).
; PLAN: r0=173(x), r1=51(y), r2=23(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 51
LDI r2, 23
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
