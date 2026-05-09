; DESCRIPTION: Creates a yellow rectangular region at (334, 79) spanning 113 by 120 pixels.
; PLAN: r0=334(x), r1=79(y), r2=113(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 79
LDI r2, 113
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
