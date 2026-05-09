; DESCRIPTION: Places a blue 100x50 rectangle at position (159, 83).
; PLAN: r0=159(x), r1=83(y), r2=100(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 83
LDI r2, 100
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
