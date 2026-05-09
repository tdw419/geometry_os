; DESCRIPTION: Creates a cyan rectangular region at (235, 101) spanning 73 by 89 pixels.
; PLAN: r0=235(x), r1=101(y), r2=73(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 101
LDI r2, 73
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
