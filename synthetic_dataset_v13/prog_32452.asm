; DESCRIPTION: Creates a purple rectangular region at (464, 56) spanning 40 by 97 pixels.
; PLAN: r0=464(x), r1=56(y), r2=40(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 56
LDI r2, 40
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
