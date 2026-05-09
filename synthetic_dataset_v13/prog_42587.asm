; DESCRIPTION: Places a black 95x101 rectangle at position (284, 92).
; PLAN: r0=284(x), r1=92(y), r2=95(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 92
LDI r2, 95
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
