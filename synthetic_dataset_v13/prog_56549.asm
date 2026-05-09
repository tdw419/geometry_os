; DESCRIPTION: Places a blue 95x105 rectangle at position (249, 10).
; PLAN: r0=249(x), r1=10(y), r2=95(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 10
LDI r2, 95
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
