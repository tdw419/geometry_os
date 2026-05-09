; DESCRIPTION: Creates a magenta rectangular region at (235, 179) spanning 69 by 57 pixels.
; PLAN: r0=235(x), r1=179(y), r2=69(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 179
LDI r2, 69
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
