; DESCRIPTION: Creates a yellow rectangular region at (56, 229) spanning 103 by 20 pixels.
; PLAN: r0=56(x), r1=229(y), r2=103(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 229
LDI r2, 103
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
