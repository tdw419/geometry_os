; DESCRIPTION: Places a black 112x47 rectangle at position (287, 142).
; PLAN: r0=287(x), r1=142(y), r2=112(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 142
LDI r2, 112
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
