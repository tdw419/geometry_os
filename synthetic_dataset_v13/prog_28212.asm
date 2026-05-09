; DESCRIPTION: Creates a cyan rectangular region at (278, 235) spanning 12 by 12 pixels.
; PLAN: r0=278(x), r1=235(y), r2=12(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 235
LDI r2, 12
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
