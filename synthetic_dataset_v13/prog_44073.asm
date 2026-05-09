; DESCRIPTION: Creates a green rectangular region at (454, 70) spanning 10 by 60 pixels.
; PLAN: r0=454(x), r1=70(y), r2=10(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 70
LDI r2, 10
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
