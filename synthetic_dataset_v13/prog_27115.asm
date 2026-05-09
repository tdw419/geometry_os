; DESCRIPTION: Creates a green rectangular region at (242, 32) spanning 71 by 115 pixels.
; PLAN: r0=242(x), r1=32(y), r2=71(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 32
LDI r2, 71
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
