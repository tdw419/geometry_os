; DESCRIPTION: Creates a blue rectangular region at (354, 49) spanning 120 by 85 pixels.
; PLAN: r0=354(x), r1=49(y), r2=120(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 49
LDI r2, 120
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
