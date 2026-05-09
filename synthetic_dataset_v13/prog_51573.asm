; DESCRIPTION: Creates a purple rectangular region at (277, 78) spanning 20 by 44 pixels.
; PLAN: r0=277(x), r1=78(y), r2=20(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 78
LDI r2, 20
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
