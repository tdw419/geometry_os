; DESCRIPTION: Creates a green rectangular region at (293, 167) spanning 102 by 65 pixels.
; PLAN: r0=293(x), r1=167(y), r2=102(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 167
LDI r2, 102
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
