; DESCRIPTION: Creates a yellow rectangular region at (200, 64) spanning 50 by 97 pixels.
; PLAN: r0=200(x), r1=64(y), r2=50(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 64
LDI r2, 50
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
