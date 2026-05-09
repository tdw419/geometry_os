; DESCRIPTION: Creates a blue rectangular region at (1, 85) spanning 113 by 100 pixels.
; PLAN: r0=1(x), r1=85(y), r2=113(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 85
LDI r2, 113
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
