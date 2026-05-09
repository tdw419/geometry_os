; DESCRIPTION: Places a blue 12x20 rectangle at position (486, 137).
; PLAN: r0=486(x), r1=137(y), r2=12(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 137
LDI r2, 12
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
