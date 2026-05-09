; DESCRIPTION: Creates a blue rectangular region at (130, 4) spanning 19 by 82 pixels.
; PLAN: r0=130(x), r1=4(y), r2=19(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 4
LDI r2, 19
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
