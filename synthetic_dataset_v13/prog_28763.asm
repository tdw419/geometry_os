; DESCRIPTION: Creates a blue rectangular region at (150, 89) spanning 16 by 13 pixels.
; PLAN: r0=150(x), r1=89(y), r2=16(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 89
LDI r2, 16
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
