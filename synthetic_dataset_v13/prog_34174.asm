; DESCRIPTION: Creates a yellow rectangular region at (126, 179) spanning 18 by 49 pixels.
; PLAN: r0=126(x), r1=179(y), r2=18(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 179
LDI r2, 18
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
