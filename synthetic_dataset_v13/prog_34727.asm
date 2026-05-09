; DESCRIPTION: Creates a blue rectangular region at (337, 85) spanning 20 by 103 pixels.
; PLAN: r0=337(x), r1=85(y), r2=20(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 85
LDI r2, 20
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
