; DESCRIPTION: Places a yellow 53x12 rectangle at position (260, 100).
; PLAN: r0=260(x), r1=100(y), r2=53(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 100
LDI r2, 53
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
