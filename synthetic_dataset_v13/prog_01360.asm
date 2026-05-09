; DESCRIPTION: Creates a yellow rectangular region at (228, 80) spanning 62 by 44 pixels.
; PLAN: r0=228(x), r1=80(y), r2=62(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 80
LDI r2, 62
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
