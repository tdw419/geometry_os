; DESCRIPTION: Creates a green rectangular region at (301, 140) spanning 27 by 54 pixels.
; PLAN: r0=301(x), r1=140(y), r2=27(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 140
LDI r2, 27
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
