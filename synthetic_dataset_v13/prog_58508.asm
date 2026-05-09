; DESCRIPTION: Creates a blue rectangular region at (322, 135) spanning 120 by 35 pixels.
; PLAN: r0=322(x), r1=135(y), r2=120(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 135
LDI r2, 120
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
