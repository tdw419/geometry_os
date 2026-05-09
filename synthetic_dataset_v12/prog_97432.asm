; DESCRIPTION: Creates a purple rectangular region at (137, 151) spanning 27 by 56 pixels.
; PLAN: r0=137(x), r1=151(y), r2=27(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 151
LDI r2, 27
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
