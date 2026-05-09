; DESCRIPTION: Creates a blue rectangular region at (118, 152) spanning 103 by 73 pixels.
; PLAN: r0=118(x), r1=152(y), r2=103(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 152
LDI r2, 103
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
