; DESCRIPTION: Creates a purple rectangular region at (365, 176) spanning 80 by 53 pixels.
; PLAN: r0=365(x), r1=176(y), r2=80(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 176
LDI r2, 80
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
