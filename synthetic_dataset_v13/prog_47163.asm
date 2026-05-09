; DESCRIPTION: Creates a purple rectangular region at (202, 35) spanning 21 by 44 pixels.
; PLAN: r0=202(x), r1=35(y), r2=21(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 35
LDI r2, 21
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
