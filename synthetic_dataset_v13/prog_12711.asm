; DESCRIPTION: Creates a purple rectangular region at (192, 77) spanning 54 by 47 pixels.
; PLAN: r0=192(x), r1=77(y), r2=54(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 77
LDI r2, 54
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
