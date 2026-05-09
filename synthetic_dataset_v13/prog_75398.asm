; DESCRIPTION: Creates a green rectangular region at (447, 40) spanning 48 by 51 pixels.
; PLAN: r0=447(x), r1=40(y), r2=48(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 40
LDI r2, 48
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
