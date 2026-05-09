; DESCRIPTION: Creates a blue rectangular region at (324, 143) spanning 95 by 55 pixels.
; PLAN: r0=324(x), r1=143(y), r2=95(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 143
LDI r2, 95
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
