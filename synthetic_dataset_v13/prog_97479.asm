; DESCRIPTION: Places a orange 32x60 rectangle at position (159, 81).
; PLAN: r0=159(x), r1=81(y), r2=32(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 81
LDI r2, 32
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
