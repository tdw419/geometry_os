; DESCRIPTION: Creates a blue rectangular region at (152, 172) spanning 14 by 71 pixels.
; PLAN: r0=152(x), r1=172(y), r2=14(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 172
LDI r2, 14
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
