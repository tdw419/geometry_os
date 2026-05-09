; DESCRIPTION: Creates a blue rectangular region at (186, 112) spanning 102 by 103 pixels.
; PLAN: r0=186(x), r1=112(y), r2=102(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 112
LDI r2, 102
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
