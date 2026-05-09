; DESCRIPTION: Creates a green rectangular region at (61, 7) spanning 45 by 100 pixels.
; PLAN: r0=61(x), r1=7(y), r2=45(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 7
LDI r2, 45
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
