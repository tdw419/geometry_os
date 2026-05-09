; DESCRIPTION: Creates a white rectangular region at (290, 234) spanning 100 by 12 pixels.
; PLAN: r0=290(x), r1=234(y), r2=100(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 234
LDI r2, 100
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
