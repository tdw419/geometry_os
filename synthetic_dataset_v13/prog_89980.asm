; DESCRIPTION: Places a blue 64x57 rectangle at position (303, 14).
; PLAN: r0=303(x), r1=14(y), r2=64(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 14
LDI r2, 64
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
