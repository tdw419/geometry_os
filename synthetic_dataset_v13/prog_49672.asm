; DESCRIPTION: Creates a purple rectangular region at (415, 54) spanning 25 by 49 pixels.
; PLAN: r0=415(x), r1=54(y), r2=25(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 54
LDI r2, 25
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
