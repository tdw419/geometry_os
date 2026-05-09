; DESCRIPTION: Creates a white rectangular region at (235, 202) spanning 112 by 30 pixels.
; PLAN: r0=235(x), r1=202(y), r2=112(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 202
LDI r2, 112
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
