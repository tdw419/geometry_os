; DESCRIPTION: Places a blue 107x47 rectangle at position (216, 48).
; PLAN: r0=216(x), r1=48(y), r2=107(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 48
LDI r2, 107
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
