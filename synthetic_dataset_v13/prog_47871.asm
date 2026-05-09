; DESCRIPTION: Creates a blue rectangular region at (124, 168) spanning 111 by 84 pixels.
; PLAN: r0=124(x), r1=168(y), r2=111(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 168
LDI r2, 111
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
