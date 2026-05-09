; DESCRIPTION: Creates a purple rectangular region at (175, 111) spanning 95 by 25 pixels.
; PLAN: r0=175(x), r1=111(y), r2=95(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 111
LDI r2, 95
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
