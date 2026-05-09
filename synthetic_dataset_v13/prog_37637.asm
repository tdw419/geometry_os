; DESCRIPTION: Creates a green rectangular region at (467, 7) spanning 20 by 112 pixels.
; PLAN: r0=467(x), r1=7(y), r2=20(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 7
LDI r2, 20
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
