; DESCRIPTION: Creates a purple rectangular region at (160, 38) spanning 10 by 109 pixels.
; PLAN: r0=160(x), r1=38(y), r2=10(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 38
LDI r2, 10
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
