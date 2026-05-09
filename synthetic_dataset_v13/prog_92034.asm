; DESCRIPTION: Creates a blue rectangular region at (329, 141) spanning 22 by 92 pixels.
; PLAN: r0=329(x), r1=141(y), r2=22(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 141
LDI r2, 22
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
