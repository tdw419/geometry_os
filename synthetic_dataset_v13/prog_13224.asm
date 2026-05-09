; DESCRIPTION: Creates a yellow rectangular region at (276, 24) spanning 103 by 85 pixels.
; PLAN: r0=276(x), r1=24(y), r2=103(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 24
LDI r2, 103
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
