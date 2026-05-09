; DESCRIPTION: Creates a purple rectangular region at (214, 52) spanning 111 by 95 pixels.
; PLAN: r0=214(x), r1=52(y), r2=111(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 52
LDI r2, 111
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
