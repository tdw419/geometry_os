; DESCRIPTION: Creates a purple rectangular region at (371, 150) spanning 18 by 57 pixels.
; PLAN: r0=371(x), r1=150(y), r2=18(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 150
LDI r2, 18
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
