; DESCRIPTION: Places a black 14x114 rectangle at position (404, 101).
; PLAN: r0=404(x), r1=101(y), r2=14(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 101
LDI r2, 14
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
