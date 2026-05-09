; DESCRIPTION: Creates a blue rectangular region at (359, 146) spanning 19 by 95 pixels.
; PLAN: r0=359(x), r1=146(y), r2=19(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 146
LDI r2, 19
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
