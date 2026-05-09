; DESCRIPTION: Creates a yellow rectangular region at (359, 180) spanning 24 by 54 pixels.
; PLAN: r0=359(x), r1=180(y), r2=24(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 180
LDI r2, 24
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
