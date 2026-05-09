; DESCRIPTION: Creates a green rectangular region at (307, 48) spanning 92 by 46 pixels.
; PLAN: r0=307(x), r1=48(y), r2=92(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 48
LDI r2, 92
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
