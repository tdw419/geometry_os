; DESCRIPTION: Creates a blue rectangular region at (87, 51) spanning 60 by 111 pixels.
; PLAN: r0=87(x), r1=51(y), r2=60(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 51
LDI r2, 60
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
