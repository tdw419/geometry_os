; DESCRIPTION: Creates a purple rectangular region at (393, 19) spanning 28 by 65 pixels.
; PLAN: r0=393(x), r1=19(y), r2=28(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 19
LDI r2, 28
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
