; DESCRIPTION: Creates a blue rectangular region at (11, 168) spanning 28 by 46 pixels.
; PLAN: r0=11(x), r1=168(y), r2=28(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 168
LDI r2, 28
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
