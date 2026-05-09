; DESCRIPTION: Creates a blue rectangular region at (52, 5) spanning 111 by 47 pixels.
; PLAN: r0=52(x), r1=5(y), r2=111(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 5
LDI r2, 111
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
