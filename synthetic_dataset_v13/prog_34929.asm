; DESCRIPTION: Places a blue 45x48 rectangle at position (205, 167).
; PLAN: r0=205(x), r1=167(y), r2=45(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 167
LDI r2, 45
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
