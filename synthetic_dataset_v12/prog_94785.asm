; DESCRIPTION: Creates a green rectangular region at (312, 120) spanning 103 by 15 pixels.
; PLAN: r0=312(x), r1=120(y), r2=103(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 120
LDI r2, 103
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
