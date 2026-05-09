; DESCRIPTION: Places a yellow 50x24 rectangle at position (399, 201).
; PLAN: r0=399(x), r1=201(y), r2=50(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 201
LDI r2, 50
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
