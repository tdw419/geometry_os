; DESCRIPTION: Creates a blue rectangular region at (367, 73) spanning 111 by 18 pixels.
; PLAN: r0=367(x), r1=73(y), r2=111(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 73
LDI r2, 111
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
