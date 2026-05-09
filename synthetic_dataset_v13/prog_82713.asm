; DESCRIPTION: Creates a green rectangular region at (360, 63) spanning 90 by 36 pixels.
; PLAN: r0=360(x), r1=63(y), r2=90(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 63
LDI r2, 90
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
