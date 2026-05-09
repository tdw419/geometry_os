; DESCRIPTION: Creates a purple rectangular region at (87, 151) spanning 44 by 11 pixels.
; PLAN: r0=87(x), r1=151(y), r2=44(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 151
LDI r2, 44
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
