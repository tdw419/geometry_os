; DESCRIPTION: Places a blue 109x38 rectangle at position (55, 205).
; PLAN: r0=55(x), r1=205(y), r2=109(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 205
LDI r2, 109
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
