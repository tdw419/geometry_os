; DESCRIPTION: Creates a black rectangular region at (290, 80) spanning 54 by 81 pixels.
; PLAN: r0=290(x), r1=80(y), r2=54(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 80
LDI r2, 54
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
