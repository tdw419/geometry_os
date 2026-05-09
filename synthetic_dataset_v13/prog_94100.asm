; DESCRIPTION: Creates a blue rectangular region at (154, 92) spanning 47 by 22 pixels.
; PLAN: r0=154(x), r1=92(y), r2=47(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 92
LDI r2, 47
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
