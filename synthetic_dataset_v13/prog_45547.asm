; DESCRIPTION: Creates a white rectangular region at (328, 103) spanning 100 by 53 pixels.
; PLAN: r0=328(x), r1=103(y), r2=100(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 103
LDI r2, 100
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
