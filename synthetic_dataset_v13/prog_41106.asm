; DESCRIPTION: Creates a blue rectangular region at (165, 117) spanning 49 by 112 pixels.
; PLAN: r0=165(x), r1=117(y), r2=49(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 117
LDI r2, 49
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
