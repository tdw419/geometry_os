; DESCRIPTION: Creates a green rectangular region at (196, 56) spanning 61 by 31 pixels.
; PLAN: r0=196(x), r1=56(y), r2=61(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 56
LDI r2, 61
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
