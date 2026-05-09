; DESCRIPTION: Creates a blue rectangular region at (376, 189) spanning 111 by 35 pixels.
; PLAN: r0=376(x), r1=189(y), r2=111(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 189
LDI r2, 111
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
