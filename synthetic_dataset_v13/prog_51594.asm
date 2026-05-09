; DESCRIPTION: Creates a white rectangular region at (165, 22) spanning 21 by 103 pixels.
; PLAN: r0=165(x), r1=22(y), r2=21(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 22
LDI r2, 21
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
