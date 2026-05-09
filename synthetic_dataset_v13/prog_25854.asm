; DESCRIPTION: Creates a purple rectangular region at (474, 115) spanning 29 by 56 pixels.
; PLAN: r0=474(x), r1=115(y), r2=29(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 115
LDI r2, 29
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
