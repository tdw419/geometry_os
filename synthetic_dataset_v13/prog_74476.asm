; DESCRIPTION: Creates a blue rectangular region at (0, 95) spanning 66 by 103 pixels.
; PLAN: r0=0(x), r1=95(y), r2=66(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 95
LDI r2, 66
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
