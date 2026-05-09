; DESCRIPTION: Creates a green rectangular region at (320, 81) spanning 69 by 61 pixels.
; PLAN: r0=320(x), r1=81(y), r2=69(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 81
LDI r2, 69
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
