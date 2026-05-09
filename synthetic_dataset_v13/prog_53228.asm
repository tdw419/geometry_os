; DESCRIPTION: Creates a white rectangular region at (366, 43) spanning 103 by 117 pixels.
; PLAN: r0=366(x), r1=43(y), r2=103(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 43
LDI r2, 103
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
