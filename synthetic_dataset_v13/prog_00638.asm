; DESCRIPTION: Places a blue 109x68 rectangle at position (331, 65).
; PLAN: r0=331(x), r1=65(y), r2=109(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 65
LDI r2, 109
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
