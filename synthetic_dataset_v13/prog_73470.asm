; DESCRIPTION: Creates a purple rectangular region at (387, 21) spanning 87 by 100 pixels.
; PLAN: r0=387(x), r1=21(y), r2=87(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 21
LDI r2, 87
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
