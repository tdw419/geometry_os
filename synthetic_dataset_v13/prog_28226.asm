; DESCRIPTION: Creates a yellow rectangular region at (276, 140) spanning 93 by 90 pixels.
; PLAN: r0=276(x), r1=140(y), r2=93(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 140
LDI r2, 93
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
