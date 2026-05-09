; DESCRIPTION: Creates a purple rectangular region at (180, 114) spanning 77 by 56 pixels.
; PLAN: r0=180(x), r1=114(y), r2=77(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 114
LDI r2, 77
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
