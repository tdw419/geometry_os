; DESCRIPTION: Creates a green rectangular region at (8, 37) spanning 120 by 92 pixels.
; PLAN: r0=8(x), r1=37(y), r2=120(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 37
LDI r2, 120
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
