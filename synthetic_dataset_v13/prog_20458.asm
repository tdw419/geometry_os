; DESCRIPTION: Creates a white rectangular region at (254, 91) spanning 117 by 113 pixels.
; PLAN: r0=254(x), r1=91(y), r2=117(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 91
LDI r2, 117
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
