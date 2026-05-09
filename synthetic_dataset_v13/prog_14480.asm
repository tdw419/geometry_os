; DESCRIPTION: Creates a green rectangular region at (279, 27) spanning 92 by 63 pixels.
; PLAN: r0=279(x), r1=27(y), r2=92(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 27
LDI r2, 92
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
