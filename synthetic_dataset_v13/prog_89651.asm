; DESCRIPTION: Places a blue 16x16 rectangle at position (413, 140).
; PLAN: r0=413(x), r1=140(y), r2=16(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 140
LDI r2, 16
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
