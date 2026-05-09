; DESCRIPTION: Creates a blue rectangular region at (49, 112) spanning 113 by 37 pixels.
; PLAN: r0=49(x), r1=112(y), r2=113(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 112
LDI r2, 113
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
