; DESCRIPTION: Places a blue 66x38 rectangle at position (315, 66).
; PLAN: r0=315(x), r1=66(y), r2=66(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 66
LDI r2, 66
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
