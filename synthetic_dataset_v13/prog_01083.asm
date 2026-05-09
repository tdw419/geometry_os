; DESCRIPTION: Places a magenta 56x45 rectangle at position (159, 48).
; PLAN: r0=159(x), r1=48(y), r2=56(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 48
LDI r2, 56
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
