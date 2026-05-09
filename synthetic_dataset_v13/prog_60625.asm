; DESCRIPTION: Creates a red rectangular region at (235, 140) spanning 13 by 94 pixels.
; PLAN: r0=235(x), r1=140(y), r2=13(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 140
LDI r2, 13
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
