; DESCRIPTION: Creates a green rectangular region at (156, 51) spanning 59 by 20 pixels.
; PLAN: r0=156(x), r1=51(y), r2=59(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 51
LDI r2, 59
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
