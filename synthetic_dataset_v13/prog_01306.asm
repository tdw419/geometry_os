; DESCRIPTION: Creates a green rectangular region at (294, 24) spanning 72 by 106 pixels.
; PLAN: r0=294(x), r1=24(y), r2=72(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 24
LDI r2, 72
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
