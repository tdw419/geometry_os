; DESCRIPTION: Creates a green rectangular region at (251, 235) spanning 26 by 20 pixels.
; PLAN: r0=251(x), r1=235(y), r2=26(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 235
LDI r2, 26
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
