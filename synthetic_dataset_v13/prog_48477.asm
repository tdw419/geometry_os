; DESCRIPTION: Creates a blue rectangular region at (4, 55) spanning 111 by 70 pixels.
; PLAN: r0=4(x), r1=55(y), r2=111(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 55
LDI r2, 111
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
