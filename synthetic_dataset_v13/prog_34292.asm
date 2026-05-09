; DESCRIPTION: Creates a purple rectangular region at (44, 186) spanning 21 by 10 pixels.
; PLAN: r0=44(x), r1=186(y), r2=21(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 186
LDI r2, 21
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
