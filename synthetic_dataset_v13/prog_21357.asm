; DESCRIPTION: Creates a blue rectangular region at (441, 135) spanning 47 by 93 pixels.
; PLAN: r0=441(x), r1=135(y), r2=47(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 135
LDI r2, 47
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
