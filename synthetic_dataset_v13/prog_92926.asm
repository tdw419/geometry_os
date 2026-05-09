; DESCRIPTION: Creates a yellow rectangular region at (363, 48) spanning 54 by 60 pixels.
; PLAN: r0=363(x), r1=48(y), r2=54(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 48
LDI r2, 54
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
