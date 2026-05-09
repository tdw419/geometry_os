; DESCRIPTION: Creates a blue rectangular region at (141, 73) spanning 44 by 86 pixels.
; PLAN: r0=141(x), r1=73(y), r2=44(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 73
LDI r2, 44
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
