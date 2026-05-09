; DESCRIPTION: Places a yellow 112x29 rectangle at position (287, 8).
; PLAN: r0=287(x), r1=8(y), r2=112(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 8
LDI r2, 112
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
