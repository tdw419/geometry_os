; DESCRIPTION: Creates a white rectangular region at (259, 100) spanning 40 by 54 pixels.
; PLAN: r0=259(x), r1=100(y), r2=40(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 100
LDI r2, 40
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
