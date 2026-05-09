; DESCRIPTION: Creates a blue rectangular region at (85, 120) spanning 81 by 120 pixels.
; PLAN: r0=85(x), r1=120(y), r2=81(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 120
LDI r2, 81
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
