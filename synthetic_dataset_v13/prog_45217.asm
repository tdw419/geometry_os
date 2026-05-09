; DESCRIPTION: Places a black 36x67 rectangle at position (414, 95).
; PLAN: r0=414(x), r1=95(y), r2=36(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 95
LDI r2, 36
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
