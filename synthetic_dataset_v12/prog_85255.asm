; DESCRIPTION: Creates a blue rectangular region at (20, 20) spanning 95 by 114 pixels.
; PLAN: r0=20(x), r1=20(y), r2=95(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 20
LDI r2, 95
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
