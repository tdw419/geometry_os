; DESCRIPTION: Places a blue 110x10 rectangle at position (191, 161).
; PLAN: r0=191(x), r1=161(y), r2=110(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 161
LDI r2, 110
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
