; DESCRIPTION: Creates a blue rectangular region at (313, 15) spanning 85 by 120 pixels.
; PLAN: r0=313(x), r1=15(y), r2=85(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 15
LDI r2, 85
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
