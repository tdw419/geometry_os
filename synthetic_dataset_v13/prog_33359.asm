; DESCRIPTION: Creates a green rectangular region at (217, 184) spanning 113 by 10 pixels.
; PLAN: r0=217(x), r1=184(y), r2=113(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 184
LDI r2, 113
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
