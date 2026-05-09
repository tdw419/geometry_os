; DESCRIPTION: Creates a green rectangular region at (242, 128) spanning 92 by 75 pixels.
; PLAN: r0=242(x), r1=128(y), r2=92(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 128
LDI r2, 92
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
