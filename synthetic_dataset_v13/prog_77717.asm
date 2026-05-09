; DESCRIPTION: Places a blue 15x49 rectangle at position (477, 177).
; PLAN: r0=477(x), r1=177(y), r2=15(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 177
LDI r2, 15
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
