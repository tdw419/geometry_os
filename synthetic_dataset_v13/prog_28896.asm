; DESCRIPTION: Creates a blue rectangular region at (115, 164) spanning 111 by 36 pixels.
; PLAN: r0=115(x), r1=164(y), r2=111(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 164
LDI r2, 111
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
