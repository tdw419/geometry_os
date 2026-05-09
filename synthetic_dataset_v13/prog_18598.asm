; DESCRIPTION: Creates a blue rectangular region at (38, 111) spanning 95 by 96 pixels.
; PLAN: r0=38(x), r1=111(y), r2=95(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 111
LDI r2, 95
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
