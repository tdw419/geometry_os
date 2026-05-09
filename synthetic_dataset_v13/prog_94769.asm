; DESCRIPTION: Draws a white rectangle at (185, 33) with width 102 and height 46.
; PLAN: r0=185(x), r1=33(y), r2=102(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 33
LDI r2, 102
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
