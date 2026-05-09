; DESCRIPTION: Creates a green rectangular region at (293, 43) spanning 114 by 109 pixels.
; PLAN: r0=293(x), r1=43(y), r2=114(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 43
LDI r2, 114
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
