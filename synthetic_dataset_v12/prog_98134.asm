; DESCRIPTION: Creates a purple rectangular region at (218, 38) spanning 52 by 93 pixels.
; PLAN: r0=218(x), r1=38(y), r2=52(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 38
LDI r2, 52
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
