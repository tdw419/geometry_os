; DESCRIPTION: Creates a purple rectangular region at (337, 21) spanning 63 by 113 pixels.
; PLAN: r0=337(x), r1=21(y), r2=63(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 21
LDI r2, 63
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
