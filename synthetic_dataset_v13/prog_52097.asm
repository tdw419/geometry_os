; DESCRIPTION: Creates a purple rectangular region at (387, 66) spanning 43 by 45 pixels.
; PLAN: r0=387(x), r1=66(y), r2=43(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 66
LDI r2, 43
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
