; DESCRIPTION: Places a yellow 112x29 rectangle at position (333, 204).
; PLAN: r0=333(x), r1=204(y), r2=112(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 204
LDI r2, 112
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
