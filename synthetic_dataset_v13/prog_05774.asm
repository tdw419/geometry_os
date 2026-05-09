; DESCRIPTION: Places a blue 90x68 rectangle at position (290, 70).
; PLAN: r0=290(x), r1=70(y), r2=90(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 70
LDI r2, 90
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
