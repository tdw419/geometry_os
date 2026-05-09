; DESCRIPTION: Creates a blue rectangular region at (22, 177) spanning 10 by 58 pixels.
; PLAN: r0=22(x), r1=177(y), r2=10(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 177
LDI r2, 10
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
