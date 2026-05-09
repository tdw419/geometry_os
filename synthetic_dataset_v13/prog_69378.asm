; DESCRIPTION: Creates a blue rectangular region at (235, 43) spanning 77 by 15 pixels.
; PLAN: r0=235(x), r1=43(y), r2=77(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 43
LDI r2, 77
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
