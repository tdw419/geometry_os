; DESCRIPTION: Creates a yellow rectangular region at (54, 61) spanning 90 by 71 pixels.
; PLAN: r0=54(x), r1=61(y), r2=90(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 61
LDI r2, 90
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
