; DESCRIPTION: Places a blue 15x105 rectangle at position (145, 126).
; PLAN: r0=145(x), r1=126(y), r2=15(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 126
LDI r2, 15
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
