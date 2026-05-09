; DESCRIPTION: Creates a green rectangular region at (74, 126) spanning 65 by 66 pixels.
; PLAN: r0=74(x), r1=126(y), r2=65(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 126
LDI r2, 65
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
