; DESCRIPTION: Creates a blue rectangular region at (320, 25) spanning 95 by 14 pixels.
; PLAN: r0=320(x), r1=25(y), r2=95(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 25
LDI r2, 95
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
