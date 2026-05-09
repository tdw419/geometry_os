; DESCRIPTION: Creates a white rectangular region at (123, 58) spanning 54 by 55 pixels.
; PLAN: r0=123(x), r1=58(y), r2=54(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 58
LDI r2, 54
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
