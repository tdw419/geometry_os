; DESCRIPTION: Places a blue 22x109 rectangle at position (15, 124).
; PLAN: r0=15(x), r1=124(y), r2=22(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 124
LDI r2, 22
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
