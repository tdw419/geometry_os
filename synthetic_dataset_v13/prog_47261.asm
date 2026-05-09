; DESCRIPTION: Creates a blue rectangular region at (465, 95) spanning 35 by 24 pixels.
; PLAN: r0=465(x), r1=95(y), r2=35(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 95
LDI r2, 35
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
