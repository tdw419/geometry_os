; DESCRIPTION: Places a black 10x92 rectangle at position (182, 60).
; PLAN: r0=182(x), r1=60(y), r2=10(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 60
LDI r2, 10
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
