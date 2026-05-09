; DESCRIPTION: Creates a purple rectangular region at (337, 38) spanning 47 by 65 pixels.
; PLAN: r0=337(x), r1=38(y), r2=47(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 38
LDI r2, 47
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
