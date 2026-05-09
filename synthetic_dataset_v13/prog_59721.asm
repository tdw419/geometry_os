; DESCRIPTION: Places a blue 65x48 rectangle at position (413, 94).
; PLAN: r0=413(x), r1=94(y), r2=65(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 94
LDI r2, 65
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
