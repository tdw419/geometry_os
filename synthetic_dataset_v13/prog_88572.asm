; DESCRIPTION: Creates a white rectangular region at (235, 35) spanning 114 by 111 pixels.
; PLAN: r0=235(x), r1=35(y), r2=114(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 35
LDI r2, 114
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
