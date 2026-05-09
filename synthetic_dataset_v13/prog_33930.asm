; DESCRIPTION: Creates a yellow rectangular region at (276, 120) spanning 23 by 112 pixels.
; PLAN: r0=276(x), r1=120(y), r2=23(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 120
LDI r2, 23
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
