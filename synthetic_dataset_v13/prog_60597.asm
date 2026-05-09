; DESCRIPTION: Creates a black rectangular region at (290, 58) spanning 60 by 85 pixels.
; PLAN: r0=290(x), r1=58(y), r2=60(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 58
LDI r2, 60
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
