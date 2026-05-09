; DESCRIPTION: Creates a purple rectangular region at (198, 68) spanning 120 by 99 pixels.
; PLAN: r0=198(x), r1=68(y), r2=120(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 68
LDI r2, 120
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
