; DESCRIPTION: Places a black 66x78 rectangle at position (284, 83).
; PLAN: r0=284(x), r1=83(y), r2=66(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 83
LDI r2, 66
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
