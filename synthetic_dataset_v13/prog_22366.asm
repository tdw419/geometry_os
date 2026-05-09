; DESCRIPTION: Creates a green rectangular region at (79, 74) spanning 36 by 56 pixels.
; PLAN: r0=79(x), r1=74(y), r2=36(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 74
LDI r2, 36
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
