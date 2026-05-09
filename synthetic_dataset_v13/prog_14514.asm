; DESCRIPTION: Creates a green rectangular region at (320, 97) spanning 120 by 102 pixels.
; PLAN: r0=320(x), r1=97(y), r2=120(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 97
LDI r2, 120
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
