; DESCRIPTION: Creates a blue rectangular region at (23, 103) spanning 45 by 110 pixels.
; PLAN: r0=23(x), r1=103(y), r2=45(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 103
LDI r2, 45
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
