; DESCRIPTION: Places a blue 75x45 rectangle at position (260, 194).
; PLAN: r0=260(x), r1=194(y), r2=75(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 194
LDI r2, 75
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
