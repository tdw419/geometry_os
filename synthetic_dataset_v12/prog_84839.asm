; DESCRIPTION: Places a blue 76x29 rectangle at position (216, 177).
; PLAN: r0=216(x), r1=177(y), r2=76(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 177
LDI r2, 76
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
