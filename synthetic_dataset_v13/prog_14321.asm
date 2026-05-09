; DESCRIPTION: Creates a green rectangular region at (85, 107) spanning 27 by 22 pixels.
; PLAN: r0=85(x), r1=107(y), r2=27(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 107
LDI r2, 27
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
