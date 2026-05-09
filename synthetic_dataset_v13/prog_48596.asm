; DESCRIPTION: Places a blue 90x94 rectangle at position (106, 152).
; PLAN: r0=106(x), r1=152(y), r2=90(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 152
LDI r2, 90
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
