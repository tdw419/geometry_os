; DESCRIPTION: Creates a white rectangular region at (243, 144) spanning 99 by 62 pixels.
; PLAN: r0=243(x), r1=144(y), r2=99(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 144
LDI r2, 99
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
