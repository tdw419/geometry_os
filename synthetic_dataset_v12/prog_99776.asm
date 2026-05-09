; DESCRIPTION: Creates a blue rectangular region at (82, 1) spanning 18 by 33 pixels.
; PLAN: r0=82(x), r1=1(y), r2=18(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 1
LDI r2, 18
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
