; DESCRIPTION: Creates a white rectangular region at (223, 183) spanning 91 by 54 pixels.
; PLAN: r0=223(x), r1=183(y), r2=91(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 183
LDI r2, 91
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
