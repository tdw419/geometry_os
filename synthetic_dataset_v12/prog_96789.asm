; DESCRIPTION: Creates a blue rectangular region at (298, 5) spanning 106 by 112 pixels.
; PLAN: r0=298(x), r1=5(y), r2=106(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 5
LDI r2, 106
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
