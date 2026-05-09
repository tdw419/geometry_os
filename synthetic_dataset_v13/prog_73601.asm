; DESCRIPTION: Creates a blue rectangular region at (106, 8) spanning 106 by 116 pixels.
; PLAN: r0=106(x), r1=8(y), r2=106(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 8
LDI r2, 106
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
