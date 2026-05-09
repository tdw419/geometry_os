; DESCRIPTION: Creates a purple rectangular region at (331, 164) spanning 107 by 55 pixels.
; PLAN: r0=331(x), r1=164(y), r2=107(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 164
LDI r2, 107
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
