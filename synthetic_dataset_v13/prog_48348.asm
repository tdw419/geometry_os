; DESCRIPTION: Places a black 112x36 rectangle at position (165, 14).
; PLAN: r0=165(x), r1=14(y), r2=112(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 14
LDI r2, 112
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
