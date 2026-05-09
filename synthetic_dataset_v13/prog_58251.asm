; DESCRIPTION: Places a blue 38x66 rectangle at position (106, 70).
; PLAN: r0=106(x), r1=70(y), r2=38(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 70
LDI r2, 38
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
