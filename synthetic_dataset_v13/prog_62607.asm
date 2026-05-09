; DESCRIPTION: Creates a blue rectangular region at (73, 152) spanning 49 by 64 pixels.
; PLAN: r0=73(x), r1=152(y), r2=49(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 152
LDI r2, 49
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
