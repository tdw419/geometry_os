; DESCRIPTION: Creates a purple rectangular region at (255, 118) spanning 111 by 44 pixels.
; PLAN: r0=255(x), r1=118(y), r2=111(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 118
LDI r2, 111
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
